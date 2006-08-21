package com.topcoder.web.tc.controller.request.tournament.tccc06;

import com.topcoder.security.Util;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;

import javax.servlet.http.Cookie;

/**
 * This processor will receieve a request from the AOL servers.  That request
 * will contain an auth token and an "Encrypted User ID".  The processor
 * will use those two pieces of data to make a subscription request via
 * the AOL alerts API.  We will make that request using a component
 * built for that purpose.
 * <p/>
 * We will get a response via that same API.  At that point we will provide
 * results to the user.  Either, it will be a successful subscription, or not.
 * We should be sure to log important information like
 * <ul>
 * <li>handle<li>
 * <li>success/failure</li>
 * <li>failure message</li>
 * <li>aol screen name</li>
 * <li>user guid</li>
 * <li>subscription id</li>
 * </ul>
 *
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 18, 2006
 */
public class AOLAuthReply extends BaseProcessor {
    protected static final Logger log = Logger.getLogger(AOLAuthReply.class);

    //todo handle the case where we're resubscribing to the same thing gracefully

    protected void businessProcessing() throws Exception {
        Cookie[] cookies = getRequest().getCookies();

        Cookie theOneCookie = null;
        for (int i = 0; i < cookies.length; i++) {
            if (AOLAlertsDescription.AOL_COOKIE.equals(cookies[i].getName())) {
                theOneCookie = cookies[i];
                break;
            }
        }
        if (theOneCookie == null) {
            throw new NavigationException("Sorry, there was a error attempting to communicate between AOL and TopCoder.");
        } else {
            try {
                String val = Util.decodePassword(theOneCookie.getValue(), AOLAlertsDescription.AOL_ALIAS);
                long userId = Long.parseLong(val);
                boolean isGroupSignup = AOLAlertsDescription.AOL_GROUP_ALERT.equals(getRequest().getParameter("PartnerContext"));
                boolean isIndividualSignup = AOLAlertsDescription.AOL_INDIVIDUAL_ALERT.equals(getRequest().getParameter("PartnerContext"));

                if (isGroupSignup) {
                    if (log.isDebugEnabled()) {
                        log.debug("signup " + userId + " for group alert");
                    }
                } else if (isIndividualSignup) {
                    if (log.isDebugEnabled()) {
                        log.debug("signup " + userId + " for individual alert");
                    }
                } else {
                    throw new NavigationException("Request did not include the type of alert");
                }
            } catch (Exception e) {
                throw new NavigationException("Sorry, there was a error attempting to communicate between AOL and TopCoder.");
            }
        }


    }
}
