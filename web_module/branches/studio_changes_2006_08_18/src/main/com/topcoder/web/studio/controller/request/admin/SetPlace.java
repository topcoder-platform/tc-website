package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.ContestResult;
import com.topcoder.web.studio.model.Prize;
import com.topcoder.web.studio.model.ReviewStatus;
import com.topcoder.web.studio.model.Submission;

import java.util.Iterator;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class SetPlace extends Base {
    protected void dbProcessing() throws Exception {

        Long submissionId;
        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }

        Long prizeId;
        try {
            prizeId = new Long(getRequest().getParameter(Constants.PRIZE_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid prize Specified");
        }
        if (log.isDebugEnabled()) {
            log.debug("got prize: " + prizeId);
        }

        StudioDAOFactory factory = StudioDAOUtil.getFactory();
        Submission s = factory.getSubmissionDAO().find(submissionId);

        if (s == null) {
            throw new NavigationException("Invalid Submission Specified");
        } else if (s.getReview() == null) {
            throw new NavigationException("Submission not reviewed, it can not place.");
        } else if (!s.getReview().getStatus().equals(factory.getReviewStatusDAO().find(ReviewStatus.PASSED))) {
            throw new NavigationException("Submission did not pass, it can not place.");
        } else {

            Set prizes = s.getContest().getPrizes();
            boolean found = false;
            Prize p = null;
            for (Iterator it = prizes.iterator(); it.hasNext() && !found;) {
                p = (Prize) it.next();
                found = prizeId.equals(p.getId());
            }
            if (p == null) {
                throw new NavigationException("Invalid Prize Specified");
            } else {
                ContestResult cr = new ContestResult();
                cr.setContest(s.getContest());
                cr.setPrize(p);
                cr.setSubmission(s);
                s.setResult(cr);
                factory.getSubmissionDAO().saveOrUpdate(s);
            }
        }

        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                "=AdminViewSubmissionDetail&" + Constants.SUBMISSION_ID + "=" + s.getId());
        setIsNextPageInContext(false);

    }
}
