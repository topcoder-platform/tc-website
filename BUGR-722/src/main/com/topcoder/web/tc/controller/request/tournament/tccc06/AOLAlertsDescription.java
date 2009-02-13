package com.topcoder.web.tc.controller.request.tournament.tccc06;

import com.topcoder.security.Util;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;

import javax.servlet.http.Cookie;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 18, 2006
 */
public class AOLAlertsDescription extends BaseProcessor {
    protected static final Logger log = Logger.getLogger(AOLAlertsDescription.class);

    protected void businessProcessing() throws Exception {
        //write a cookie with something for when they get back
        if (userIdentified()) {
            long before = System.currentTimeMillis();
            String val = Util.encodePassword(String.valueOf(getUser().getId()), AOLHelper.AOL_ALIAS);
            long after = System.currentTimeMillis();
            if (log.isDebugEnabled()) {
                log.debug("encrypted id is: " + val + " it took " + (after - before) + " ms");
            }
            Cookie c = new Cookie(AOLHelper.AOL_COOKIE, val);
            c.setMaxAge(60 * 60);//1 hour
            getResponse().addCookie(c);

            setNextPage("/tournaments/tccc06/aol_alerts_description.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }
}
