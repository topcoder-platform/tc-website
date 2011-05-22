/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg;

import java.io.Serializable;

import javax.servlet.http.HttpSession;

import com.topcoder.shared.security.User;

/**
 * <p>
 * A helper class to be used for wrapping the current HTTP session associated with the incoming request.
 * </p>
 * 
 * @author live_world
 * @version 1.0
 */
public class SessionData implements Serializable {

    /**
     * serial version UID.
     */
    private static final long serialVersionUID = -2384549654178868372L;

    /**
     * Session key for captcha word.
     */
    private static final String CAPTCHA_WORD_SESSION_KEY = "capword";

    /**
     * Session key for current user.
     */
    private static final String USER_SESSION_KEY = "user";

    /**
     * <p>
     * An <code>HttpSession</code> managed by this helper.
     * </p>
     */
    private HttpSession session;

    /**
     * <p>
     * Constructs new <code>SessionData</code> instance wrapping the specified HTTP session.
     * </p>
     * 
     * @param session an <code>HttpSession</code> providing the current session associated with incoming request.
     * @throws IllegalArgumentException if specified <code>session</code> is <code>null</code>.
     */
    public SessionData(HttpSession session) {
        if (session == null) {
            throw new IllegalArgumentException("The parameter [session] is NULL");
        }
        this.session = session;
    }

    /**
     * Sets the details for current user authenticated to application.
     * 
     * @param user a User representing the authenticated user to be associated with the current HTTP session.
     */
    public void setCurrentUser(User user) {
        if (user == null) {
            session.removeAttribute(USER_SESSION_KEY);
            return;
        }
        session.setAttribute(USER_SESSION_KEY, user);
    }

    /**
     * Gets current user.
     * 
     * @return the current user.
     */
    public User getCurrentUser() {
        return (User) session.getAttribute(USER_SESSION_KEY);
    }

    /**
     * Gets the captcha word for registration.
     * 
     * @return the captcha word from session
     */
    public String getCaptchaWord() {
        return (String) session.getAttribute(CAPTCHA_WORD_SESSION_KEY);
    }

    /**
     * Sets the captcha word for registration.
     * 
     * @param captchaWord the captcha word
     */
    public void setCaptchaWord(String captchaWord) {
        if (captchaWord == null) {
            session.removeAttribute(CAPTCHA_WORD_SESSION_KEY);
            return;
        }
        session.setAttribute(CAPTCHA_WORD_SESSION_KEY, captchaWord);
    }
}
