package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.shared.util.dwload.CacheClearer;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.ContestResult;
import com.topcoder.web.studio.model.Prize;
import com.topcoder.web.studio.model.ReviewStatus;
import com.topcoder.web.studio.model.Submission;

import java.util.HashSet;
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

        Long prizeId = null;
        if (!"".equals(StringUtils.checkNull(getRequest().getParameter(Constants.PRIZE_ID)))) {
            try {
                prizeId = new Long(getRequest().getParameter(Constants.PRIZE_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid prize Specified");
            }
        }
        if (log.isDebugEnabled()) {
            log.debug("got prize: " + prizeId);
        }

        StudioDAOFactory factory = StudioDAOUtil.getFactory();
        Submission submission = factory.getSubmissionDAO().find(submissionId);

        if (submission == null) {
            throw new NavigationException("Invalid Submission Specified");
        } else if (submission.getReview() == null) {
            throw new NavigationException("Submission not reviewed, it can not place.");
        } else if (!submission.getReview().getStatus().equals(factory.getReviewStatusDAO().find(ReviewStatus.PASSED))) {
            throw new NavigationException("Submission did not pass, it can not place.");
        } else {

            Prize p = null;
            if (prizeId != null) {
                Set<Prize> prizes = submission.getContest().getPrizes();
                boolean found = false;
                for (Iterator<Prize> it = prizes.iterator(); it.hasNext() && !found;) {
                    p = it.next();
                    found = prizeId.equals(p.getId());
                }
            }
            if (prizeId == null) {
                //clear prize
                submission.getResult().setPrize(null);
                factory.getSubmissionDAO().saveOrUpdate(submission);
            } else if (p == null) {
                throw new NavigationException("Invalid Prize Specified");
            } else {
                ContestResult cr = null;
                if (submission.getResult() == null) {
                    cr = new ContestResult(submission);
                } else {
                    cr = submission.getResult();
                }
                cr.setPrize(p);
                factory.getSubmissionDAO().saveOrUpdate(submission);
            }
            try {
                HashSet<String> cachedStuff = new HashSet<String>();
                cachedStuff.add(Constants.CONTEST_ID + "=" + submission.getContest().getId().toString());
                cachedStuff.add("studio_home_data");
                CacheClearer.removelike(cachedStuff);
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }

        }

        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                "=AdminViewSubmissionDetail&" + Constants.SUBMISSION_ID + "=" + submission.getId());
        setIsNextPageInContext(false);

    }
}
