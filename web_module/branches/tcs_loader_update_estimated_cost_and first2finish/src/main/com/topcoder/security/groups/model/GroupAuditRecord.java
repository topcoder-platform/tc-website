/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.model;

import java.util.Date;

/**
 * <p>
 * This class represents an audit record of a user action
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization Assembly v1.0 )
 * @since 1.0
 */
public class GroupAuditRecord extends IdentifiableEntity {

    /**
     * <p>
     * Represents the date of the audit. It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */
    private Date date;

    /**
     * <p>
     * Represents the handle of the user performing the action It is managed
     * with a getter and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private String handle;

    /**
     * <p>
     * Represents the IP address of the user performing the action It is managed
     * with a getter and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private String ipAddress;

    /**
     * <p>
     * Represents the previous value It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */
    private String previousValue;

    /**
     * <p>
     * Represents the new value. It is managed with a getter and setter, hence
     * fully mutable. It may have any value.
     * </p>
     */
    private String newValue;

    /**
     * <p>
     * Default constructor.
     * </p>
     */
    public GroupAuditRecord() {
    }

    /**
     * <p>
     * Getter of the date field.
     * </p>
     * 
     * @return the date
     */
    public Date getDate() {
        return date;
    }

    /**
     * <p>
     * Setter of the date field.
     * </p>
     * 
     * @param date
     *            the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * <p>
     * Getter of the handle field.
     * </p>
     * 
     * @return the handle
     */
    public String getHandle() {
        return handle;
    }

    /**
     * <p>
     * Setter of the handle field.
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
     * Getter of the ipAddress field.
     * </p>
     * 
     * @return the ipAddress
     */
    public String getIpAddress() {
        return ipAddress;
    }

    /**
     * <p>
     * Setter of the ipAddress field.
     * </p>
     * 
     * @param ipAddress
     *            the ipAddress to set
     */
    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    /**
     * <p>
     * Getter of the previousValue field.
     * </p>
     * 
     * @return the previousValue
     */
    public String getPreviousValue() {
        return previousValue;
    }

    /**
     * <p>
     * Setter of the previousValue field.
     * </p>
     * 
     * @param previousValue
     *            the previousValue to set
     */
    public void setPreviousValue(String previousValue) {
        this.previousValue = previousValue;
    }

    /**
     * <p>
     * Getter of the newValue field.
     * </p>
     * 
     * @return the newValue
     */
    public String getNewValue() {
        return newValue;
    }

    /**
     * <p>
     * Setter of the newValue field.
     * </p>
     * 
     * @param newValue
     *            the newValue to set
     */
    public void setNewValue(String newValue) {
        this.newValue = newValue;
    }
}
