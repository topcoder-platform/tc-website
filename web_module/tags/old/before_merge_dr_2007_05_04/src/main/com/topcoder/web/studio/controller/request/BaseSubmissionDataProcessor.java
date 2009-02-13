package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestResult;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionStatus;

import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 28, 2006
 */
abstract class BaseSubmissionDataProcessor extends ShortHibernateProcessor {

    boolean isWinner(User u, Contest c, SubmissionDAO dao, Integer ct) {
        List submissions = dao.getSubmissions(u, c, ct, SubmissionStatus.ACTIVE);

        boolean isWinner = false;
        for (Iterator it = submissions.iterator(); it.hasNext() && !isWinner;) {
            Submission s = (Submission) it.next();
            ContestResult curr;
            for (Iterator it2 = s.getContest().getResults().iterator(); it2.hasNext() && !isWinner;) {
                curr = (ContestResult) it2.next();
                isWinner = s.equals(curr.getSubmission()) && curr.getPrize().getPlace() != null;
            }
        }
        return isWinner;
    }

    void loadSubmissionData(User u, Contest c, SubmissionDAO dao, Integer ct) {
        Integer maxRank = dao.getMaxRank(c, u);
        loadSubmissionData(u, c, dao, maxRank, ct);
    }

    void loadSubmissionData(User u, Contest c, SubmissionDAO dao, Integer maxRank, Integer ct) {
        getRequest().setAttribute("maxRank", maxRank);

        List submissions = dao.getSubmissions(u, c, ct, SubmissionStatus.ACTIVE);

        Submission curr;
        for (Object submission : submissions) {
            curr = (Submission) submission;
            setDefault(Constants.SUBMISSION_ID + curr.getId(), curr.getRank());
        }

        getRequest().setAttribute("submissions", submissions);
        getRequest().setAttribute("contest", c);

    }

}


