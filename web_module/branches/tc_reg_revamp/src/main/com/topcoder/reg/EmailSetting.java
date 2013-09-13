/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg;

/**
 * <p>
 * This class encapsulates the email settings. It's a POJO.
 * </p>
 * <p>
 * <strong>Thread Safety: </strong> It's mutable and not thread safe.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class EmailSetting {

    /**
     * Represents email body template file.
     */
    private String emailBodyTemplateFile;

    /**
     * Represents activation email subject.
     */
    private String emailSubject;

    /**
     * Represents activation email sender name.
     */
    private String senderName;

    /**
     * Represents activation email from address.
     */
    private String emailFromAddress;

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getEmailBodyTemplateFile() {
        return emailBodyTemplateFile;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param emailBodyTemplateFile
     *            the name-sake field to set
     */
    public void setEmailBodyTemplateFile(String emailBodyTemplateFile) {
        this.emailBodyTemplateFile = emailBodyTemplateFile;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getEmailSubject() {
        return emailSubject;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param emailSubject
     *            the name-sake field to set
     */
    public void setEmailSubject(String emailSubject) {
        this.emailSubject = emailSubject;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getEmailFromAddress() {
        return emailFromAddress;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param emailFromAddress
     *            the name-sake field to set
     */
    public void setEmailFromAddress(String emailFromAddress) {
        this.emailFromAddress = emailFromAddress;
    }

    /**
     * Getter of the name-sake field.
     *
     * @return the value of name-sake field.
     */
    public String getSenderName() {
        return senderName;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param senderName
     *            the name-sake field to set
     */
    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }
}
