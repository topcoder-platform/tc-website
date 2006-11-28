package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.model.Submission;

import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 28, 2006
 */
abstract class BaseSubmissionDataProcessor extends ShortHibernateProcessor {

    void loadSubmissionData(Submission s, SubmissionDAO dao) {
        Integer maxRank = dao.getMaxRank(s.getContest(), s.getSubmitter());
        loadSubmissionData(s, dao, maxRank);
    }

    void loadSubmissionData(Submission s, SubmissionDAO dao, Integer maxRank) {
        getRequest().setAttribute("maxRank", maxRank);

        List submissions = dao.getSubmissions(s.getSubmitter(), s.getContest());

        Submission curr;
        for (Iterator it = submissions.iterator(); it.hasNext();) {
            curr = (Submission)it.next();
            setDefault(Constants.SUBMISSION_ID+curr.getId(), curr.getRank());
        }

        getRequest().setAttribute("submissions", submissions);
        getRequest().setAttribute("contest", s.getContest());

    }

}


