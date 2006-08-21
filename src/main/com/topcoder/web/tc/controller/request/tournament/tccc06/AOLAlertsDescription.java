package com.topcoder.web.tc.controller.request.tournament.tccc06;

import com.topcoder.security.Util;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;

import javax.servlet.http.Cookie;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 18, 2006
 */
public class AOLAlertsDescription extends BaseProcessor {
    protected static final Logger log = Logger.getLogger(AOLAlertsDescription.class);

    static String AOL_COOKIE = "aolcind";
    static String AOL_ALIAS = "lkjadf933jkadf";
    public static String AOL_GROUP_ALERT = "group";
    public static String AOL_INDIVIDUAL_ALERT = "ind";

    protected void businessProcessing() throws Exception {
        //write a cookie with something for when they get back

        long before = System.currentTimeMillis();
        String val = Util.encodePassword(String.valueOf(getUser().getId()), AOL_ALIAS);
        long after = System.currentTimeMillis();
        if (log.isDebugEnabled()) {
            log.debug("encrtyped id is: " + val + " it took " + (after - before) + " ms");
        }
        Cookie c = new Cookie(AOL_COOKIE, val);
        c.setMaxAge(60 * 60);//1 hour
        getResponse().addCookie(c);

        setNextPage("/tournaments/tccc06/aol_alerts_description.jsp");
        setIsNextPageInContext(true);
    }
}
