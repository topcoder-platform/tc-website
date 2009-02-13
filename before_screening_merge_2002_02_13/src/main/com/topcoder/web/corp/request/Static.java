package com.topcoder.web.corp.request;

import com.topcoder.security.NotAuthorizedException;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.corp.Util;

/**
 * <p> Title: Static </p>
 * <p> Description: Handles "static" pages.  Serve up jsp's in essentially
 * any directory (below the root) The request processor gets the list of
 * parameters out of the request, validates them, and then processes them.
 *
 * @version   1.1.2.33
 * @author    Daniel Cohn
 */

public class Static extends BaseProcessor {

    private static final String STATIC_PREFIX = "d";  // Prefix for parameters
    private static final String VALID_PARAMETER_CHARS =
            "_-ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private final static Logger log = Logger.getLogger(Static.class);

    /** Constructor sets pageInContext to true since all Static pages are in
     *  the same context
     */
    public Static() {
        pageInContext = true;
    }

    /** process() method in BaseProcessor calls this businessProcessing()
     *  method to define the next Page.
     *  @throws Exception
     */
    void businessProcessing() throws Exception {

        String originatingPage = request.getRequestURI();
        if (request.getQueryString() != null) {
            originatingPage += "?" + request.getQueryString();
        }
        log.debug("Original static request: " + originatingPage);

        nextPage = requestProcessor();
        log.debug("Static processor set user's nextPage to: " + nextPage);

        if (!havePermission()) {
            log.debug(
                    "user [id=" + authToken.getActiveUser().getId() + "] does not " +
                    "have enough permissions to access: " + nextPage
            );
            /* Controller will catch NotAuthorizedException and forward
               to login page if user is anonymous and send to permission
               error page if user is logged in but not authorized.  */
            throw new NotAuthorizedException("Not enough permissions to access"
                    + " static page: " + nextPage);
        }
    }


    /**
     * method to check that user has permissions to access static page
     *
     * @return boolean - true if user has permissions to access static page
     * @throws Exception
     */
    private boolean havePermission() throws Exception {
        int lastSlashIndex = nextPage.lastIndexOf("/");
        String staticPageDirectory = nextPage.substring(0, lastSlashIndex);
        if (!staticPageDirectory.equals("")) {
            TCSubject tcUser
                    = Util.retrieveTCSubject(authToken.getActiveUser().getId());
            Authorization authorization = new TCSAuthorization(tcUser);

            boolean allowedToRun = authorization.hasPermission(
                    new SimpleResource(staticPageDirectory)
            );
            if (!allowedToRun) {
                return false;
            }
        }
        return true;
    }


    /**
     * method for processesing a page request and checking to make sure it
     * is valid then returning the "served up" page containing a valid URI
     * to display.
     *
     * @return String - the actual URI of where to send the browser
     * @throws Exception
     */
    private String requestProcessor() throws Exception {

        boolean found = false;
        String cur = null;
        StringBuffer ret = new StringBuffer();

        /* start generating the return string containing the URL */
        for (int i = 1; !found; i++) {
            cur = request.getParameter(STATIC_PREFIX + i);
            if (cur == null) {
                /* if there is not a (STATIC_PREFIX+1) go to home page
                   (set in web.xml MainServlet init parameter "page-main") */
                if (i == 1) {
                    return (String) request.getAttribute("homePage");
                }
                found = true;
            } else {
                int check = validParameter(cur);  // returns -1 if valid.
                if (check == -1) {
                    ret.append("/" + cur);
                } else {
                    char invalidChar = cur.charAt(check);
                    throw new Exception(
                            "parameter #" + i + ": \"" + cur +
                            "\" invalid character found: '" + invalidChar + "'.");
                }
            }
        }
        ret.append(".jsp");
        return ret.toString();
    }

    /** If parameter is valid return -1, otherwise returns the index
     *  of the invalid character in the request.
     * @param param parameter to check for validity.
     * @return index of invalid character, or -1 if param is valid
     */
    private int validParameter(String param) {
        for (int i = 0; i < param.length(); i++) {
            char curChar = param.charAt(i);
            if (VALID_PARAMETER_CHARS.indexOf(curChar) == -1)
                return i;
        }
        return -1;
    }
}
