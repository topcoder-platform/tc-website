package com.topcoder.web.studio.controller.request.admin;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.InitialContext;

import com.topcoder.service.studio.StudioService;
import com.topcoder.service.studio.ejb.StudioServiceBean;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class AddSubmissionPrize extends Base {

	@Override
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
            log.debug("AddSubmissionPrize_new: submissionId=" + submissionId + " prizeId=" + prizeId);
        }
        //throw new RuntimeException("AddSubmissionPrize_new: submissionId=" + submissionId + " prizeId=" + prizeId);
        Hashtable props = new Hashtable();
        //Properties props = new Properties();
        props.put(Context.PROVIDER_URL, "127.0.0.1:1399");
        Context ctx = new InitialContext(props);
        if (log.isDebugEnabled()) {
            log.debug("Obtained context");
        }
        StudioServiceBean studioService = (StudioServiceBean)ctx.lookup("StudioServiceBean/remote");
        if (log.isDebugEnabled()) {
            log.debug("Obtained studio service");
        }
        
        //studioService.setSubmissionPlacement(submissionId, prizeId);
        
        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                "=ViewSubmissionDetail&" + Constants.SUBMISSION_ID + "=" + submissionId);
        setIsNextPageInContext(false);
	}
	
    /*protected void submissionProcessing(Submission s, Prize p) throws Exception {
        s.addPrize(p);
        //if the prize is a contest prize and we haven't set a contest result placed record for this
        //then set one.  the site uses contest result to show place, so we need to set that up
        //in the case that we're not using online review.
        if (p.getType().getId().equals(PrizeType.CONTEST)) {
            ContestResult cr = s.getResult();
            if (cr == null) {
                cr = new ContestResult(s);
            }
            if (cr.getPlaced() == null) {
                cr.setPlaced(p.getPlace());
            }
        }
    }*/
}

