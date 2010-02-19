/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * Check for a valid User logged on in the current session.  If there is no
 * such user, forward control to the logon page.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class CheckLogonTag extends TagSupport {

    // --------------------------------------------------- Instance Variables

    /**
     * The key of the session-scope bean we look for.
     */
    private String name = Constants.USER_KEY;

    /**
     * The page to which we should forward for the user to log on.
     */
    private String page = "/login.jsp";

    // ----------------------------------------------------------- Properties

    /**
     * Return the bean name.
     *
     * @return the bean name.
     */
    public String getName() {
        return (this.name);
    }

    /**
     * Set the bean name.
     *
     * @param name The new bean name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Return the forward page.
     *
     * @return the forward page.
     */
    public String getPage() {
        return (this.page);
    }

    /**
     * Set the forward page.
     *
     * @param page The new forward page
     */
    public void setPage(String page) {
        this.page = page;
    }

    // ------------------------------------------------------- Public Methods

    /**
     * Defer our checking until the end of this tag is encountered.
     *
     * @return SKIP_BODY
     * @exception JspException if a JSP exception has occurred
     */
    public int doStartTag() throws JspException {
        return (SKIP_BODY);
    }


    /**
     * Perform our logged-in user check by looking for the existence of
     * a session scope bean under the specified name.  If this bean is not
     * present, control is forwarded to the specified logon page.
     *
     * @return EVAL_PAGE if valid, otherwise SKIP_PAGE
     * @exception JspException if a JSP exception has occurred
     */
    public int doEndTag() throws JspException {
        // Is there a valid user logged on?
        boolean valid = false;
        HttpSession session = pageContext.getSession();
        if ((session != null) && (session.getAttribute(name) != null)) {
            valid = true;
        } else if (session.getAttribute("public") != null) {
            valid = true;
        }

        // Forward control based on the results
        if (valid) {
            return (EVAL_PAGE);
        } else {
            try {
                pageContext.forward(page);
            } catch (Exception e) {
                throw new JspException(e.toString());
            }
            return (SKIP_PAGE);
        }
    }


    /**
     * Release any acquired resources.
     */
    public void release() {
        super.release();
        this.name = Constants.USER_KEY;
        this.page = "/login.jsp";
    }
}
