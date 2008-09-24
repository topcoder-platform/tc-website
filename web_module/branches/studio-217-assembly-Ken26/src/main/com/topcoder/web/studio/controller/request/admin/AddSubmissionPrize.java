package com.topcoder.web.studio.controller.request.admin;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.topcoder.service.studio.ContestData;
import com.topcoder.service.studio.PersistenceException;
import com.topcoder.service.studio.PrizeData;
import com.topcoder.service.studio.StudioService;
import com.topcoder.service.studio.SubmissionData;
import com.topcoder.shared.util.dwload.CacheClearer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.model.Prize;
import com.topcoder.web.studio.model.ReviewStatus;
import com.topcoder.web.studio.util.StudioServiceLocator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00 Create Date: Aug 29,
 *          2006
 */
// public class AddSubmissionPrize extends SubmissionPrizeBase {
// protected void submissionProcessing(Submission s, Prize p) throws Exception {
// s.addPrize(p);
// //if the prize is a contest prize and we haven't set a contest result placed
// record for this
// //then set one. the site uses contest result to show place, so we need to set
// that up
// //in the case that we're not using online review.
// if (p.getType().getId().equals(PrizeType.CONTEST)) {
// ContestResult cr = s.getResult();
// if (cr == null) {
// cr = new ContestResult(s);
// }
// if (cr.getPlaced() == null) {
// cr.setPlaced(p.getPlace());
// }
// }
// }
// }
public class AddSubmissionPrize extends Base {

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
                throw new NavigationException("Invalid Prize Specified");
            }
        } else {
            throw new NavigationException("Invalid Prize Specified");
        }
        
		try {
			StudioServiceLocator.getService().setSubmissionPlacement(submissionId, prizeId);
		} catch (Exception e) {
			throw new NavigationException("Submission could not be assigned to a prize");
		}

        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                "=ViewSubmissionDetail&" + Constants.SUBMISSION_ID + "=" + submissionId);
        setIsNextPageInContext(false);

    }

}