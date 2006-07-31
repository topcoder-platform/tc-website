/*
 * PaymentInfo.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import com.topcoder.apps.review.persistence.Common;

import java.io.Serializable;


/**
 * <p>
 * The payment information stored within this system is provided to aid
 * managers in keeping track of the status of their projects, but is
 * not for direct use by the financial department.
 * </p>
 *
 * @author FatClimber
 * @version 1.0
 */
public class PaymentInfo implements Serializable {
    private long id;
    private float amount;
    private PaymentStatus paymentStatus;
    private boolean dirtyFlag = false;
    private long versionId;

    /**
     * Creates a new PaymentInfo object.
     *
     * @param id DOCUMENT ME!
     * @param amount DOCUMENT ME!
     * @param paymentStatus DOCUMENT ME!
     * @param versionId DOCUMENT ME!
     */
    public PaymentInfo(long id, float amount, PaymentStatus paymentStatus, long versionId) {
        this.id = id;
        this.amount = amount;
        this.paymentStatus = paymentStatus;
        this.versionId = versionId;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected boolean getDirty() {
        return dirtyFlag;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected long getVersionId() {
        return versionId;
    }

    /**
     * <p>
     * Return the (database) id.
     * </p>
     *
     * @return long the id.
     */
    public long getId() {
        return id;
    }

    /**
     * <p>
     * Set the amount of payment.
     * </p>
     *
     * @param amount The amount of payment.
     */
    public void setPayment(float newAmount) {
        if (this.amount != newAmount) {
            this.amount = newAmount;
            this.dirtyFlag = true;
        }
    }

    /**
     * <p>
     * Return the amount of payment.
     * </p>
     *
     * @return the amount of payment.
     */
    public float getPayment() {
        return amount;
    }

    /**
     * <p>
     * Return the payment status.
     * </p>
     *
     * @return the payment status.
     */
    public PaymentStatus getPaymentStatus() {
        return paymentStatus;
    }

    /**
     * <p>
     * Set the payment status.
     * </p>
     *
     * @param status The payment status.
     */
    public void setPaymentStatus(PaymentStatus newStatus) {
        if (!Common.equals(this.paymentStatus, newStatus)) {
            this.paymentStatus = newStatus;
            this.dirtyFlag = true;
        }
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof PaymentInfo)) {
            return false;
        }

        PaymentInfo paymentInfo = (PaymentInfo) o;

        return paymentInfo.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
