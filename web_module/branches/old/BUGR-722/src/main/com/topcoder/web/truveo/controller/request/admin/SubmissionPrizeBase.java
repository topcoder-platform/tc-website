package com.topcoder.web.truveo.controller.request.admin;

import com.topcoder.web.truveo.Constants;
import com.topcoder.web.truveo.model.Submission;
import com.topcoder.web.truveo.model.ReviewStatus;
import com.topcoder.web.truveo.model.Prize;
import com.topcoder.web.truveo.dao.TruveoDAOFactory;
import com.topcoder.web.truveo.dao.TruveoDAOUtil;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.shared.util.dwload.CacheClearer;

import java.util.Set;
import java.util.Iterator;
import java.util.HashSet;

/**
 * @author dok
 * @version $Revision: 70395 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 7, 2007
 */
abstract class SubmissionPrizeBase extends Base {
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
        } else {
            throw new NavigationException("Invalid prize Specified");
        }
        if (log.isDebugEnabled()) {
            log.debug("got prize: " + prizeId);
        }

        TruveoDAOFactory factory = TruveoDAOUtil.getFactory();
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
                //look to see if the prize is one of the prizes for this contest.
                Set<Prize> prizes = submission.getContest().getPrizes();
                boolean found = false;
                for (Iterator<Prize> it = prizes.iterator(); it.hasNext() && !found;) {
                    p = it.next();
                    found = prizeId.equals(p.getId());
                }
            }
            if (p == null) {
                //it wasn't part of this contest, so error out
                throw new NavigationException("Invalid Prize Specified");
            } else {
                submissionProcessing(submission, p);
            }
            try {
                HashSet<String> cachedStuff = new HashSet<String>();
                cachedStuff.add(Constants.CONTEST_ID + "=" + submission.getContest().getId().toString());
                cachedStuff.add("truveo_home_data");
                CacheClearer.removelike(cachedStuff);
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }

        }

        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                "=ViewSubmissionDetail&" + Constants.SUBMISSION_ID + "=" + submission.getId());
        setIsNextPageInContext(false);

    }

    protected abstract void submissionProcessing(Submission submission, Prize p) throws Exception;
}

