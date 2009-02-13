package com.topcoder.web.corp.controller.request;

import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.PathResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.Util;
import com.topcoder.web.corp.Constants;


/**
 * <p> Title: Static </p>
 * <p> Description: Handles "static" pages.  Serve up jsp's in essentially
 * any directory (below the root) The request processor gets the list of
 * parameters out of the request, validates them, and then processes them.
 *
 * @version   1.1.2.33
 * @author    Daniel Cohn, Ambrose Feinstein, Greg Paul
 */

public class Static extends BaseProcessor {

    private static final String STATIC_PREFIX = "d";  // Prefix for parameters
    private static final String VALID_PARAMETER_CHARS =
            "_-ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private final static Logger log = Logger.getLogger(Static.class);


    protected void businessProcessing() throws TCWebException {

        StringBuffer path = new StringBuffer(100);
        for (int i = 1; ; i++) {
            String p = getRequest().getParameter(STATIC_PREFIX + i);
            if (p == null) break;
            if (!isLegal(p)) throw new NavigationException();
            path.append("/").append(p);
        }
        if (path.length() == 0)
            path.append(Constants.WELCOME_PAGE);
        else
            path.append(".jsp");

        log.debug("next page: " + path.toString());

        try {
            Authorization authorization = new TCSAuthorization(Util.retrieveTCSubject(getUser().getId()));
            /* check whether the path is allowed for this type of user */
            if (!authorization.hasPermission(new PathResource(path.toString())))
                throw new PermissionException(getUser(),
                        new PathResource(path.toString()), new Exception("access to page denied"));
        } catch (PermissionException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        setNextPage(path.toString());
        setIsNextPageInContext(true);
    }

    public static boolean isLegal(String s) {
        if (s == null) return false;
        if (s.equals("")) return false;
        char[] c = s.toCharArray();
        for (int i = 0; i < c.length; i++)
            if (0 > VALID_PARAMETER_CHARS.indexOf(c[i]))
                return false;
        return true;
    }

}
