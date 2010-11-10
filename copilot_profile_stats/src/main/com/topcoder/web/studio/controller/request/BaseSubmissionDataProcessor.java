package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionStatus;
import com.topcoder.web.studio.model.SubmissionType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 28, 2006
 */
abstract class BaseSubmissionDataProcessor extends ShortHibernateProcessor {

    boolean userPlaced(User u, Contest c, SubmissionDAO dao) {
        List<Submission> submissions = dao.getSubmissions(u, c, SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE, SubmissionStatus.ACTIVE);

        boolean isWinner = false;
        for (Submission submission : submissions) {
            if (submission.getPrizes().iterator().hasNext()) {
                isWinner = true;
                break;
            }
        }
        return isWinner;
    }

    void loadSubmissionData(User u, Contest c, SubmissionDAO dao, Integer submissionTypeId) {
        Integer maxRank = dao.getMaxRank(c, u);
        loadSubmissionData(u, c, dao, maxRank, submissionTypeId);
    }

    void loadSubmissionData(User u, Contest c, SubmissionDAO dao, Integer maxRank, Integer submissionTypeId) {
        getRequest().setAttribute("maxRank", maxRank);

        List<Submission> submissions = dao.getSubmissions(u, c, submissionTypeId, SubmissionStatus.ACTIVE);
        for (Submission curr : submissions) {
            setDefault(Constants.SUBMISSION_ID + curr.getId(), curr.getRank());
        }

        getRequest().setAttribute("submissions", submissions);
        getRequest().setAttribute("contest", c);

    }

}


