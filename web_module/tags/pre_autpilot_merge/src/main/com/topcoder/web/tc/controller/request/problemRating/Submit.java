package com.topcoder.web.tc.controller.request.problemRating;

import com.topcoder.security.TCSubject;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.problemrating.ProblemRatingServices;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;


/**
 * This puts the results of a problem rating into the DB
 * @author lbackstrom 07.08.2003
 */
public class Submit extends PRBase {

    protected static final TCSubject CREATE_USER = new TCSubject(100000);

    protected void businessProcessing() throws TCWebException {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        long userID = getUser().getId();
        try {
            int pid = 0;
            try {
                pid = Integer.parseInt(getRequest().getParameter("pid"));
            } catch (Exception e) {
                throw new Exception("Error parsing pid: " + getRequest().getParameter("pid"));
            }
            Request r = new Request();
            r.setContentHandle("Problem Rating Submit");
            r.setProperty("pm", String.valueOf(pid));
            r.setProperty("cr", String.valueOf(userID));
            //response data has to be live, no cache
            DataAccessInt dataAccess = getDataAccess();
            Map qMap = dataAccess.getData(r);
            ResultSetContainer ratings = (ResultSetContainer) qMap.get("problem rated");

            if (ratings.getRow(0).getIntItem("count") != 0) {
                //user already rated problem, show results
                processResults();
                return;
            }
            ResultSetContainer problemName = (ResultSetContainer) qMap.get("problem name");
            if (problemName.size() == 0) {
                throw new Exception("Problem not yet used, or non-existent.");
            }

            ProblemRatingServices prs = (ProblemRatingServices) createEJB(getInitialContext(), ProblemRatingServices.class);


            ResultSetContainer questionsRSC = (ResultSetContainer) qMap.get("problem rating questions");
            Iterator it = questionsRSC.iterator();
            ArrayList questions = new ArrayList(10);
            ArrayList answers = new ArrayList(10);
            int qid, rating = 0;
            String error = null;
            while (it.hasNext()) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) it.next();
                qid = row.getIntItem("question_id");
                try {
                    rating = Integer.parseInt(getRequest().getParameter("q" + qid));
                } catch (Exception e) {
                    error = "Please answer all of the questions.";
                }
                if ((rating < 1 || rating > 10) && error == null) {
                    error = "You must rate each question between 1 and 10, inclusive.";
                }
                if (error != null) {
                    addError("problemRating", error);
                    processQuestions();
                    return;
                }
                questions.add(new Integer(qid));
                answers.add(new Integer(rating));
            }
            for (int i = 0; i < questions.size(); i++) {
                qid = ((Integer) questions.get(i)).intValue();
                rating = ((Integer) answers.get(i)).intValue();
                prs.createProblemRating(qid, userID, pid);
                prs.setProblemRating(qid, userID, pid, rating);
            }
            processResults();
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
