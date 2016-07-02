/*
 * Copyright (C) 2016 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;


/**
 * Base payment class for the task
 *
 * @author TCSCODER
 * @version 1.0
 */
public abstract class BaseTaskPayment extends BasePayment {
    /**
     * The task id
     */
    private long taskId;

    /**
     * Create a payment that references a task
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param taskId task that is being paid.
     */
    public BaseTaskPayment(int paymentTypeId, long coderId, double grossAmount, long taskId) {
        this(paymentTypeId, coderId, grossAmount, null, taskId, 0);
    }

    /**
     * Create a payment that references a task
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param taskId task that is being paid.
     * @param placed the place of the coder in the task.
     */
    public BaseTaskPayment(int paymentTypeId, long coderId, double grossAmount, long taskId, int placed) {
        this(paymentTypeId, coderId, grossAmount, null, taskId, placed);
    }

    /**
     * Create a payment that references a task
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param taskId task that is being paid.
     */
    public BaseTaskPayment(int paymentTypeId, long coderId, double grossAmount,
            String client, long taskId) {
        this(paymentTypeId, coderId, grossAmount, client, taskId, 0);
    }

    /**
     * Create a payment that references a task
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param taskId task that is being paid.
     * @param placed the place of the coder in the task.
     */
    public BaseTaskPayment(int paymentTypeId, long coderId, double grossAmount,
            String client, long taskId, int placed) {
        super(paymentTypeId, coderId, client, grossAmount, placed);
        this.taskId = taskId;
    }

    /**
     * Get the id of the task paid.
     *
     * @return the id of the task paid.
     */
    public long getTaskId() {
        return this.taskId;
    }

    /**
     * Set the id of the task paid.
     *
     * @param taskId the id of the task paid.
     */
    public void setTaskId(long taskId) {
        fieldChanged(MODIFICATION_REFERENCE, taskId != this.taskId);
        this.taskId = taskId;
    }

    /**
     * Get a processor for this type of payment.
     *
     * @return a processor for this type of payment.
     */
    protected BasePayment.Processor getProcessor() {
        return new Processor();
    }

    /**
     * Processor for task payment.
     * It just returns the descriptions and dates stored in the payment.
     *
     * @author TCSCODER
     * @version 1.0
     */
    protected static class Processor extends BasePayment.Processor {

        /**
         * Get the name of the reference.
         *
         * @return an empty string
         * @throws SQLException if an error occurred trying to access db.
         */
        public String lookupReferenceDescription(BasePayment payment) throws SQLException {
            return "";
        }

        /**
         * Get the description of the payment.
         *
         * @param payment payment to retrieve its description.
         * @return the description of the payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            return payment.getDescription();
        }

        /**
         * Get the event date of the payment.
         *
         * @param payment payment to retrieve its event date.
         * @return the event date of the payment.
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            return payment.getEventDate();
        }
    }
}
