/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.util.log.Level;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Extends from <strong>BaseAction</strong> that logoff the user.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class LogoffAction extends BaseAction {

    final String UID_COOKIE_NAME = "tcs_user_id";
    final String HASH_COOKIE_NAME = "tcs_hash";

    // --------------------------------------------------------- Public Methods

    /**
     * Process the specified HTTP request, and create the corresponding HTTP
     * response (or forward to another web component that will create it).
     * Return an <code>ActionForward</code> instance describing where and how
     * control should be forwarded, or <code>null</code> if the response has
     * already been completed.
     *
     * @param mapping The ActionMapping used to select this instance
     * @param form The optional ActionForm bean for this request (if any)
     * @param request The HTTP request we are processing
     * @param response The HTTP response we are creating
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet exception occurs
     */
    public ActionForward perform(ActionMapping mapping,
                                 ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response)
            throws IOException, ServletException {

        HttpSession session = request.getSession();
        log(Level.INFO, "LogoffAction in session " + session.getId());

        // Remove the user session
        session.removeAttribute(Constants.USER_KEY);
        session.removeAttribute(Constants.PROJECT_LIST_KEY);

        // Remove stuff used by dde
        session.removeValue("nav_redirect_msg");
        session.removeValue("TCSUBJECT");
        session.removeValue("TCUSER");
        session.removeValue("AdminTCSubject");
        session.removeAttribute("LOGIN_FLAG");

        Cookie userIdCookie = new Cookie(UID_COOKIE_NAME, "");
        userIdCookie.setPath("/");
        userIdCookie.setMaxAge(0);
        response.addCookie(userIdCookie);

        Cookie hashedPasswordCookie = new Cookie(HASH_COOKIE_NAME, "");
        hashedPasswordCookie.setPath("/");
        hashedPasswordCookie.setMaxAge(0);
        response.addCookie(hashedPasswordCookie);

        // Forward control to the specified success URI
        return (mapping.findForward(Constants.LOGOFF_KEY));
    }
}
