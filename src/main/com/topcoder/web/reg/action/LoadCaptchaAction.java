/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.action;

import org.apache.struts2.ServletActionContext;

import com.topcoder.web.reg.Captcha;
import com.topcoder.web.reg.CaptchaGenerator;

/**
 * <p>
 * Loads captcha action for registering user.
 * </p>
 * <p>
 * Version 1.1 change log: This class has been completely refactored, major
 * logic has been extracted into {@link CaptchaGenerator}.
 * </p>
 * 
 * @author live_world, leo_lol
 * @since 1.0
 * @version 1.1
 */
public class LoadCaptchaAction extends BaseAction {
    /**
     * serial version UID.
     */
    private static final long serialVersionUID = -8269912852720222864L;

    /**
     * Captcha file name.
     */
    private String captchaFile;

    /**
     * Captcha Generator, this class would manage the lifecycle of all captchas.
     * It's be injected by Spring. Not null after IoC.
     */
    private CaptchaGenerator captchaGenerator;

    /**
     * Loads captcha for registering a new user.
     * 
     * @return a <code>String</code> referencing the next view or action to
     *         route request to
     * @throws Exception
     *             if an unexpected error occurs while processing the request
     */
    @Override
    public String execute() throws Exception {
        Captcha captcha = captchaGenerator.generate(ServletActionContext.getRequest());
        captchaFile = captcha.getPath();
        getSessionData().setCaptchaWord(captcha.getWord());
        // store the UUID
        ServletActionContext.getRequest().getSession().setAttribute("UUID", captcha.getUuid());
        return SUCCESS;
    }

    /**
     * The getter for the captchaFile instance variable.
     * 
     * @return the captchaFile
     */
    public String getCaptchaFile() {
        return captchaFile;
    }

    /**
     * <p>
     * Setter of captchaGenerator field.
     * </p>
     * 
     * @param captchaGenerator
     *            the captchaGenerator to set
     */
    public void setCaptchaGenerator(CaptchaGenerator captchaGenerator) {
        this.captchaGenerator = captchaGenerator;
    }
}
