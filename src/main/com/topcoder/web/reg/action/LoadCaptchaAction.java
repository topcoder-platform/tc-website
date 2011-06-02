/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.action;

import java.io.FileOutputStream;

import org.apache.struts2.ServletActionContext;

import com.topcoder.randomstringimg.RandomStringImage;

/**
 * <p>
 * Loads captcha action for registering user.
 * </p>
 * 
 * @author live_world
 * @version 1.0
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
     * Random string image configuration file.
     */
    private String randomStringImageConfigFile;

    /**
     * Loads captcha for registering a new user.
     * 
     * @return a <code>String</code> referencing the next view or action to route request to
     * @throws Exception if an unexpected error occurs while processing the request
     */
    @Override
    public String execute() throws Exception {
        try {
            captchaFile = "REG_" + System.currentTimeMillis() + ".png";
            String appRoot = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/");
            RandomStringImage rsi = new RandomStringImage(randomStringImageConfigFile);
            FileOutputStream fos = new FileOutputStream(appRoot + "i/captcha/" + captchaFile);

            try {
                String word = rsi.generateRandomFromDictionaries(fos);
                getSessionData().setCaptchaWord(word);
            } finally {
                fos.close();
            }
        } catch (Throwable e) {
            e.printStackTrace();
        }
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
     * The setter for the randomStringImageConfigFile instance variable.
     * 
     * @param randomStringImageConfigFile the randomStringImageConfigFile to set
     */
    public void setRandomStringImageConfigFile(String randomStringImageConfigFile) {
        this.randomStringImageConfigFile = randomStringImageConfigFile;
    }
}
