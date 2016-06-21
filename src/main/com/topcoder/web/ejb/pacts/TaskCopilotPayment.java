/*
 * Copyright (C) 2016 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.pacts;


/**
 * Payment class for the task copilot.
 *
 * @author TCSCODER
 * @version 1.0
 */
public class TaskCopilotPayment extends BaseTaskPayment {
    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;
   
    /**
     * Create a copilot payment that references a task
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param taskId task that is being paid.
     */
    public TaskCopilotPayment(long coderId, double grossAmount, long taskId) {
        super(TASK_COPILOT_PAYMENT, coderId, grossAmount, taskId);
    }

    /**
     * Create a copilot payment that references a task
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param taskId task that is being paid.
     * @param placed the place of the coder in the task.
     */
    public TaskCopilotPayment(long coderId, double grossAmount, long taskId, int placed) {
        super(TASK_COPILOT_PAYMENT, coderId, grossAmount, taskId, placed);
    }

    /**
     * Create a copilot payment that references a task
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param taskId task that is being paid.
     */
    public TaskCopilotPayment(long coderId, double grossAmount, String client, long taskId) {
        super(TASK_COPILOT_PAYMENT, coderId, grossAmount, client, taskId);
    }

    /**
     * Create a copilot payment that references a task
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param taskId task that is being paid.
     * @param placed the place of the coder in the task.
     */
    public TaskCopilotPayment(long coderId, double grossAmount, String client, long taskId, int placed) {
        super(TASK_COPILOT_PAYMENT, coderId, grossAmount, client, taskId, placed);
    }
}
