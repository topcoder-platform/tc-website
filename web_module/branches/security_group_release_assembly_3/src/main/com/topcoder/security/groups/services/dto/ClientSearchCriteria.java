/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.dto;

/**
 * <p>
 * This class represents a filter object for searching for clients. All criteria
 * will be ANDed, except where specified.
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe
 * </p>
 * 
 * @author TCSASSEMBLER
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization
 *          Assembly v1.0 )
 * @since 1.0
 */
public class ClientSearchCriteria {
    /**
     * <p>
     * Represents the name of the client It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */
    private String clientName;

    /**
     * <p>
     * Represents the billing account name It is managed with a getter and
     * setter, hence fully mutable. It may have any value.
     * </p>
     */
    private String billingAccountName;

    /**
     * <p>
     * Represents the name of the project It is managed with a getter and
     * setter, hence fully mutable. It may have any value.
     * </p>
     */
    private String projectName;

    /**
     * <p>
     * Default constructor.
     * </p>
     */
    public ClientSearchCriteria() {
    }

    /**
     * <p>
     * Getter of clientName field.
     * </p>
     * 
     * @return the clientName
     */
    public String getClientName() {
        return clientName;
    }

    /**
     * <p>
     * Setter of clientName field.
     * </p>
     * 
     * @param clientName
     *            the clientName to set
     */
    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    /**
     * <p>
     * Getter of billingAcountName field.
     * </p>
     * 
     * @return the billingAcountName
     */
    public String getBillingAccountName() {
        return billingAccountName;
    }

    /**
     * <p>
     * Setter of billingAcountName field.
     * </p>
     * 
     * @param billingAcountName
     *            the billingAcountName to set
     */
    public void setBillingAccountName(String billingAccountName) {
        this.billingAccountName = billingAccountName;
    }

    /**
     * <p>
     * Getter of projectName field.
     * </p>
     * 
     * @return the projectName
     */
    public String getProjectName() {
        return projectName;
    }

    /**
     * <p>
     * Setter of projectName field.
     * </p>
     * 
     * @param projectName
     *            the projectName to set
     */
    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }
}
