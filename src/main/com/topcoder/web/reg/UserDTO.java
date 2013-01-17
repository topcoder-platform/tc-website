/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * <p>
 * This class is used to receive user input from front-end. It's a POJO.
 * </p>
 * <p>
 * <strong>Thread Safety: </strong> It's mutable and not thread safe.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
@XmlRootElement(name = "user")
public class UserDTO {
    /**
     * First name.
     */
    private String firstName;

    /**
     * Last name.
     */
    private String lastName;

    /**
     * User handle.
     */
    private String handle;

    /**
     * User password.
     */
    private String password;

    /**
     * User confirm password.
     */
    private String confirmPassword;

    /**
     * User email address.
     */
    private String email;
    
    /**
     * captcha word of the user.
     */
    private String captchaWord;

    /**
     * Activation URL.
     */
    private String activationURL;

    /**
     * <p>
     * Getter of firstName field.
     * </p>
     * 
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * <p>
     * Setter of firstName field.
     * </p>
     * 
     * @param firstName
     *            the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * <p>
     * Getter of lastName field.
     * </p>
     * 
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * <p>
     * Setter of lastName field.
     * </p>
     * 
     * @param lastName
     *            the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * <p>
     * Getter of handle field.
     * </p>
     * 
     * @return the handle
     */
    public String getHandle() {
        return handle;
    }

    /**
     * <p>
     * Setter of handle field.
     * </p>
     * 
     * @param handle
     *            the handle to set
     */
    public void setHandle(String handle) {
        this.handle = handle;
    }

    /**
     * <p>
     * Getter of password field.
     * </p>
     * 
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * <p>
     * Setter of password field.
     * </p>
     * 
     * @param password
     *            the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * <p>
     * Getter of confirmPassword field.
     * </p>
     * 
     * @return the confirmPassword
     */
    public String getConfirmPassword() {
        return confirmPassword;
    }

    /**
     * <p>
     * Setter of confirmPassword field.
     * </p>
     * 
     * @param confirmPassword
     *            the confirmPassword to set
     */
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    /**
     * <p>
     * Getter of email field.
     * </p>
     * 
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * <p>
     * Setter of email field.
     * </p>
     * 
     * @param email
     *            the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return value of name-sake field.
     */
    public String getActivationURL() {
        return activationURL;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param activationURL
     *            value to assign to the name-sake field.
     */
    public void setActivationURL(String activationURL) {
        this.activationURL = activationURL;
    }

    /**
     * <p>
     * Getter of captchaWord field.
     * </p>
     *
     * @return the captchaWord
     */
    public String getCaptchaWord() {
        return captchaWord;
    }

    /**
     * <p>
     * Setter of captchaWord field.
     * </p>
     *
     * @param captchaWord the captchaWord to set
     */
    public void setCaptchaWord(String captchaWord) {
        this.captchaWord = captchaWord;
    }
}
