package com.topcoder.web.tc.controller.request.problemRating;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.security.TCSubject;
import com.topcoder.web.ejb.ProblemRatingServices.ProblemRatingServices;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.rmi.PortableRemoteObject;
import javax.servlet.http.HttpServletRequest;
import java.util.Iterator;
import java.util.Enumeration;
import java.util.ArrayList;
import java.rmi.RemoteException;
import java.util.Map;


/**
 * This puts the results of a problem rating into the DB
 * @author lbackstrom 07.08.2003
 */
public class Submit extends Base {

    protected static final TCSubject CREATE_USER = new TCSubject(100000);

    protected void businessProcessing() throws TCWebException{
        if(getUser().isAnonymous()){
            throw new PermissionException(getUser(),new ClassResource(this.getClass()));
        }
        long userID = getUser().getId();
        InitialContext ctx = null;
        HttpServletRequest request = null;
        try {
            Request r = new Request();
            r.setContentHandle("Problem Rating Submit");
            r.setProperty("pm", getRequest().getParameter(Constants.PROBLEM_ID));
            r.setProperty("cr", String.valueOf(userID));
            //response data has to be live, no cache
            DataAccessInt dataAccess = getDataAccess();
            Map qMap = dataAccess.getData(r);
            ResultSetContainer ratings = (ResultSetContainer) qMap.get("problem rated");
            
            if(ratings.getRow(0).getIntItem("count")!=0){
                throw new NavigationException("You may only rate a problem once.");
            }
            ctx = new InitialContext();
            ProblemRatingServices prs = (ProblemRatingServices)createEJB(ctx, ProblemRatingServices.class);
            request = getRequest();

            ResultSetContainer questionsRSC = (ResultSetContainer) qMap.get("problem rating questions");
            Iterator it = questionsRSC.iterator();
            ArrayList questions = new ArrayList(10);
            ArrayList answers = new ArrayList(10);
            int qid, rating = 0;
            while(it.hasNext()){
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow)it.next();
                qid = row.getIntItem("question_id");
                try{
                    rating = Integer.parseInt(request.getParameter("q"+qid));
                }catch(Exception e){
                    addError("problemRating","Please answer all of the questions.");
                    setNextPage("?" + Constants.MODULE_KEY + "=ProblemRatingQuestions");
                    setIsNextPageInContext(true);
                    return;
                }
                if(rating < 1 || rating > 10){
                    addError("problemRating","You must rate each question between 1 and 10, inclusive.");
                    setNextPage("?" + Constants.MODULE_KEY + "=ProblemRatingQuestions");
                    setIsNextPageInContext(true);
                    return;
                }
                questions.add(new Integer(qid));
                answers.add(new Integer(rating));
            }
            int pid = 0;
            try{
                pid = Integer.parseInt(request.getParameter("pid"));
            }catch(Exception e){
                throw new NavigationException("Problem ID is invalid");
            }
            for(int i = 0; i<questions.size(); i++){
                qid = ((Integer)questions.get(i)).intValue();
                rating = ((Integer)answers.get(i)).intValue();
                prs.createProblemRating(qid, userID, pid);
                prs.setProblemRating(qid,userID,pid,rating);
            }
            setNextPage("?" + Constants.MODULE_KEY + "=ProblemRatingResults&" + Constants.PROBLEM_ID + "=" + request.getParameter("pid"));
            setIsNextPageInContext(true);
        }catch(NavigationException e){
            throw e;
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
