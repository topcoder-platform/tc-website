/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.model;

/**
 * <p>
 * This class represents a user that is an administrator for a client.
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization Assembly v1.0 )
 * @since 1.0
 */
public class CustomerAdministrator extends IdentifiableEntity {

    /**
     * <p>
     * Represents the ID of the user that is the administrator. It is managed
     * with a getter and setter, thus fully mutable. It may have any value
     *</p>
     */
    private long userId;

    /**
     * <p>
     * Represents the client for whom the user is an administrator It is managed
     * with a getter and setter, thus fully mutable. It may have any value
     *</p>
     */
    private Client client;

    /**
     * <p>
     * Default constructor.
     * </p>
     */
    public CustomerAdministrator() {
    }

    /**
     * <p>
     * Getter of the userId field.
     * </p>
     * @return the userId
     */
    public long getUserId() {
        return userId;
    }

    /**
     * <p>
     * Setter of the userId field.
     * </p>
     * @param userId the userId to set
     */
    public void setUserId(long userId) {
        this.userId = userId;
    }

    /**
     * <p>
     * Getter of the client field.
     * </p>
     * @return the client
     */
    public Client getClient() {
        return client;
    }

    /**
     * <p>
     * Setter of the client field.
     * </p>
     * @param client the client to set
     */
    public void setClient(Client client) {
        this.client = client;
    }
}
