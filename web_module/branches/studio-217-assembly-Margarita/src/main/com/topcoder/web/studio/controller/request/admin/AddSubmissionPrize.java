package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.service.studio.ejb.StudioServiceBean;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.HashSet;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class AddSubmissionPrize extends Base /*extends SubmissionPrizeBase*/ {

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

        Context context = TCContext.getContext(ApplicationServer.STUDIO_SERVICES_PROVIDER_URL);
        log.debug("got context");
        //Context ctx = new InitialContext();
        //StudioServiceBean studioServiceBean = (StudioServiceBean)context.lookup("");
        /*submissionProcessing(submission, p);
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

        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY + "=ViewSubmissionDetail&" + Constants.SUBMISSION_ID + "=" + submission.getId());
        setIsNextPageInContext(false);*/
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
   } */
}

