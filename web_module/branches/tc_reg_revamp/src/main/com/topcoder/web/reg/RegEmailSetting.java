/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg;

/**
 * <p>
 * This class encapsulates the email settings of registration. It's a POJO.
 * </p>
 * <p>
 * <strong>Thread Safety: </strong> It's mutable and not thread safe.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class RegEmailSetting {
    /**
     * Represents activation email body template file.
     */
    private String activationEmailBodyTemplateFile;

    /**
     * Represents activation email subject.
     */
    private String activationEmailSubject;

    /**
     * Represents activation email from address.
     */
    private String activationEmailFromAddress;

    /**
     * <p>
     * Getter of activationEmailBodyTemplateFile field.
     * </p>
     * 
     * @return the activationEmailBodyTemplateFile
     */
    public String getActivationEmailBodyTemplateFile() {
        return activationEmailBodyTemplateFile;
    }

    /**
     * <p>
     * Setter of activationEmailBodyTemplateFile field.
     * </p>
     * 
     * @param activationEmailBodyTemplateFile
     *            the activationEmailBodyTemplateFile to set
     */
    public void setActivationEmailBodyTemplateFile(String activationEmailBodyTemplateFile) {
        this.activationEmailBodyTemplateFile = activationEmailBodyTemplateFile;
    }

    /**
     * <p>
     * Getter of activationEmailSubject field.
     * </p>
     * 
     * @return the activationEmailSubject
     */
    public String getActivationEmailSubject() {
        return activationEmailSubject;
    }

    /**
     * <p>
     * Setter of activationEmailSubject field.
     * </p>
     * 
     * @param activationEmailSubject
     *            the activationEmailSubject to set
     */
    public void setActivationEmailSubject(String activationEmailSubject) {
        this.activationEmailSubject = activationEmailSubject;
    }

    /**
     * <p>
     * Getter of activationEmailFromAddress field.
     * </p>
     * 
     * @return the activationEmailFromAddress
     */
    public String getActivationEmailFromAddress() {
        return activationEmailFromAddress;
    }

    /**
     * <p>
     * Setter of activationEmailFromAddress field.
     * </p>
     * 
     * @param activationEmailFromAddress
     *            the activationEmailFromAddress to set
     */
    public void setActivationEmailFromAddress(String activationEmailFromAddress) {
        this.activationEmailFromAddress = activationEmailFromAddress;
    }

}
