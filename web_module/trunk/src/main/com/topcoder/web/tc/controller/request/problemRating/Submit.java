package com.topcoder.web.tc.controller.request.problemRating;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.security.TCSubject;
import com.topcoder.web.ejb.ProblemRatingServices.ProblemRatingServices;
import com.topcoder.web.tc.Constants;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.rmi.PortableRemoteObject;
import javax.servlet.http.HttpServletRequest;
import java.util.Iterator;
import java.util.Enumeration;
import java.util.ArrayList;

/**
 * This puts the results of a problem rating into the DB
 * @author lbackstrom 07.08.2003
 */
public class Submit extends Base {

    protected static final TCSubject CREATE_USER = new TCSubject(100000);

    protected void businessProcessing() throws TCWebException{
        long userID = getUser().getId();
        InitialContext ctx = null;
        HttpServletRequest request = null;
        try {
            ctx = new InitialContext();
            ProblemRatingServices prs = (ProblemRatingServices)createEJB(ctx, ProblemRatingServices.class);
            request = getRequest();
            Enumeration en = request.getParameterNames();
            ArrayList al = new ArrayList(10);
            while(en.hasMoreElements()){
                String next = en.nextElement().toString();
                if(next.charAt(0) == 'q'){
                    try{
                        Integer question_id = new Integer(next.substring(1));
                        Integer rating = new Integer(request.getParameter(next));
                        al.add(question_id);
                        al.add(rating);
                    }catch(Exception e){
                        //this parameter wasn't really a question, don't worry about it
                    }
                }
            }
            int[] qs = new int[al.size()/2];
            int[] rs = new int[al.size()/2];
            for(int i = 0, ptr = 0; i<qs.length; i++){
                qs[i] = Integer.parseInt(al.get(ptr++).toString());
                rs[i] = Integer.parseInt(al.get(ptr++).toString());
            }
            prs.submitAnswers(qs,rs,userID,Integer.parseInt(request.getParameter("pid")));
            setNextPage("?" + Constants.MODULE_KEY + "=ProblemRatingResults&" + Constants.PROBLEM_ID + "=" + request.getParameter("pid"));
            setIsNextPageInContext(true);
        }catch(Exception e){
            if(e.getMessage().equals("Not enough answers")){
                request.setAttribute("redoError","Please answer all of the questions.");
                setNextPage("");
                setIsNextPageInContext(true);
            }else{
                e.printStackTrace();
            }
        }
    }
}
