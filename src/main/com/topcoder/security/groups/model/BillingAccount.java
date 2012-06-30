/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.model;

/**
 * <p>
 * This class represents a billing account
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization Assembly v1.0 )
 * @since 1.0
 */
public class BillingAccount extends IdentifiableEntity {

    /**
     * <p>
     * Represents the ID of the company this account is for. It is managed with a getter and setter, thus fully mutable.
     * It may have any value.
     * </p>
     */
    private long companyId;

    /**
     * <p>
     * Represents the name of the account It is managed with a getter and setter, thus fully mutable. It may have any
     * value.
     * </p>
     */
    private String name;

    /**
     * <p>
     * Represents the description of the account It is managed with a getter and setter, thus fully mutable. It may have
     * any value.
     * </p>
     */
    private String description;

    /**
     * <p>
     * Represents the client of this account. It is managed with a getter and setter, thus fully mutable. It may have
     * any value.
     * </p>
     */
    private Client client;

    /**
     * <p>
     * Represents the flag whether the account has been deleted. It is managed with a getter and setter, thus fully
     * mutable. It may have any value.
     * </p>
     */
    private boolean deleted;

    /**
     * <p>
     * Default Constructor.
     * </p>
     */
    public BillingAccount() {
    }

    /**
     * <p>
     * Getter of the companyId field.
     * </p>
     * 
     * @return the companyId
     */
    public long getCompanyId() {
        return companyId;
    }

    /**
     * <p>
     * Setter of the companyId field.
     * </p>
     * 
     * @param companyId
     *            the companyId to set
     */
    public void setCompanyId(long companyId) {
        this.companyId = companyId;
    }

    /**
     * <p>
     * Getter of the name field.
     * </p>
     * 
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Setter of the name field.
     * </p>
     * 
     * @param name
     *            the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * <p>
     * Getter of the description field.
     * </p>
     * 
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * <p>
     * Setter of the description field.
     * </p>
     * 
     * @param description
     *            the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * <p>
     * Getter of the client field.
     * </p>
     * 
     * @return the client
     */
    public Client getClient() {
        return client;
    }

    /**
     * <p>
     * Setter of the client field.
     * </p>
     * 
     * @param client
     *            the client to set
     */
    public void setClient(Client client) {
        this.client = client;
    }

    /**
     * <p>
     * Getter of the deleted field.
     * </p>
     * 
     * @return the deleted
     */
    public boolean isDeleted() {
        return deleted;
    }

    /**
     * <p>
     * Setter of the deleted field.
     * </p>
     * 
     * @param deleted
     *            the deleted to set
     */
    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}
