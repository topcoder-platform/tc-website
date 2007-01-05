package com.topcoder.web.csf.controller.request;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.model.User;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.SubmissionDAO;
import com.topcoder.web.csf.model.Submission;
import com.topcoder.web.csf.model.Contest;

import java.util.List;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 28, 2006
 */
abstract class BaseSubmissionDataProcessor extends ShortHibernateProcessor {

    void loadSubmissionData(User u, Contest c, SubmissionDAO dao) {
        Integer maxRank = dao.getMaxRank(c, u);
        loadSubmissionData(u, c, dao, maxRank);
    }

    void loadSubmissionData(User u, Contest c, SubmissionDAO dao, Integer maxRank) {
        getRequest().setAttribute("maxRank", maxRank);

        List submissions = dao.getSubmissions(u, c);

        Submission curr;
        for (Iterator it = submissions.iterator(); it.hasNext();) {
            curr = (Submission) it.next();
            setDefault(Constants.SUBMISSION_ID + curr.getId(), curr.getRank());
        }

        getRequest().setAttribute("submissions", submissions);
        getRequest().setAttribute("contest", c);

    }

}
