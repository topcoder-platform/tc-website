package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ReviewStatus;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionStatus;

import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 12, 2007
 */
public class SendToReview extends Base {

    protected void dbProcessing() throws Exception {

        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        } else {
            StudioDAOFactory factory = StudioDAOUtil.getFactory();
            Date now = new Date();
            Long cid;
            try {
                cid = new Long(contestId);
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid contest id specified");
            }
            Contest c = factory.getContestDAO().find(cid);
            //check if all the submissions in the contest have been reviewed.

            if (now.after(c.getEndTime())) {
                if (allSubmissionsReviewed(c)) {
                    for (Submission s : c.getSubmissions()) {
                        if (hasQualifyingRank(s) &&
                                SubmissionStatus.ACTIVE.equals(s.getStatus().getId()) &&
                                s.getReview() != null && ReviewStatus.PASSED.equals(s.getReview().getStatus().getId())) {
                            log.debug("XXXXXX  passed all checks, sending to OR XXXXX");
                            //todo save returned OR submission for this studio submission so we have the mapping.
                        }

                    }
                } else {
                    throw new NavigationException("Be sure to review all the submissions before attempting to send them to online review");
                }

            } else {
                throw new NavigationException("Sorry, you can't send submissions to online review until the submission phase is over.");
            }
        }
    }

    private boolean hasQualifyingRank(Submission s) {
        Contest c = s.getContest();
        return !(c.getMaxSubmissions() != null && c.getMaxSubmissions().getValue() != null)
                || s.getRank() != null &&
                s.getRank().compareTo(new Integer(c.getMaxSubmissions().getValue())) <= 0;
    }

    private boolean allSubmissionsReviewed(Contest c) {
        log.debug("start testing if all submissions reviewed");
        for (Submission s : c.getSubmissions()) {
            if (SubmissionStatus.ACTIVE.equals(s.getStatus().getId()) && s.getReview() == null) {
                log.debug("end testing if all submissinos reviewed (they were not)");
                return false;
            }
        }
        log.debug("end testing if all submissinos reviewed (they were)");
        return true;
    }

}
