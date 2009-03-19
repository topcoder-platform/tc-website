/*
 * PaymentStatus.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import java.io.Serializable;


/**
 * <p>
 * Object representation of the various options for the status of a payment
 * stored within the system.
 * </p>
 *
 * @author FatClimber
 * @version 1.0
 */
public class PaymentStatus implements Serializable {
    private long id;
    private String name;

    /**
     * Creates a new PaymentStatus object.
     *
     * @param id DOCUMENT ME!
     * @param name DOCUMENT ME!
     */
    public PaymentStatus(long id, String name) {
        this.id = id;
        this.name = name;
    }

    /**
     * <p>
     * Return the name of status.
     * </p>
     *
     * @return a String with the name of status;
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Return the id of status.
     * </p>
     *
     * @return the id of status.
     */
    public long getId() {
        return id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof PaymentStatus)) {
            return false;
        }

        PaymentStatus paymentStatus = (PaymentStatus) o;

        return paymentStatus.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
