/******************************************************************************\
 *
 * File:          PaymentHeader.java
 * Creation date: March 05, 2002 10:19
 * Author:        Matt Murphy
 * Purpose:       Store the more commonly requested information of a payment
 * See:           UserProfileHeader.java
 *                ResultSetContainer.java
 *
 * DBP 3/26 - Implement serializable
 *
 * Copyright 2002, TopCoder, Inc
 * All rights are reserved. Reproduction in whole or part is prohibited
 * without the written consent of the copyright owner.
 *
 \******************************************************************************/

package com.topcoder.web.tc.controller.legacy.pacts.common;

import java.util.Map;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.BasePaymentStatus;
import com.topcoder.web.ejb.pacts.payments.InvalidStatusException;
import com.topcoder.web.ejb.pacts.payments.InvalidStatusReasonException;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason;

/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 */
public class PaymentHeader implements PactsConstants, java.io.Serializable {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    private static Logger log = Logger.getLogger(PaymentHeader.class);

/*  Explanation of Members
*
*   _id              - the DB id of the payment details
*   _user            - the TC member associated with the payment
*   _recentStatus    - status of the most recent modification
*   _recentNetAmount - current aggregate amount of the payment
*   _description     - description of the payment
*   _type            - type of payment
*   _method          - method of payment
*   _project         - project associated with payment
*/
    private long id;
    private UserProfileHeader user;
    private String recentStatus;
    private double recentNetAmount;
    private double recentGrossAmount;
    private String description;
    private String type;
    private String method;
    private int recentStatusId;
    private int typeId;
    private long methodId;
    private String client;
    private String cockpitProjectName;
    private String billingAccountName;
    private BasePaymentStatus currentStatus;
    private String contestCategoryName;

    private long algorithmRoundId;
    private long componentProjectId;
    private long algorithmProblemId;
    private long studioContestId;
    private long componentContestId;
    private long digitalRunStageId;
    private long digitalRunSeasonId;
    private long parentPaymentId;
    private long digitalRunTrackId;

    private String modifyDate;
    private String createDate;

    private String invoiceNumber;
    private String jiraIssueName;

    /**************\
     *              *
     * Constructors *
     *              *
     \**************/

/* Basic constructor that sets all the default values and such
*
*  @ARGS none
*/
    public PaymentHeader() {
        id = 0;
        user = new UserProfileHeader();
        recentStatus = "Default Status";
        recentNetAmount = 0;
        description = "Default Description";
        type = "Default Type";
        method = "Default Method";
        recentStatusId = 0;
        currentStatus = null;
        typeId = 0;
        methodId = 1;   // Not Set
    }

/* This constructor makes the object out of the Map containing
*  the ResultSetContainer with the constant name of PAYMENT_HEADER_LIST
*
*  @ARGS
*   o Map results - the map containing PAYMENT_HEADER_LIST
*   o int row     - the row in the RSC in which to find info for this PaymentHeader
*
*/
    public PaymentHeader(Map results, int row) {
        ResultSetContainer rsc = (ResultSetContainer) results.get(PAYMENT_HEADER_LIST);
        if (rsc == null) {
            log.error("There is no " + PAYMENT_HEADER_LIST + " in the ResultSetContainer");
            id = 0;
            user = new UserProfileHeader();
            recentStatus = "Default Status";
            recentNetAmount = 0;
            description = "Default Description";
            type = "Default Type";
            method = "Default Method";
            return;
        }

        int numRows = rsc.getRowCount();
        if (numRows <= row || row < 0) {
            log.error("Bad row number: " + row);
            id = 0;
            user = new UserProfileHeader();
            recentStatus = "Default Status";
            recentNetAmount = 0;
            description = "Default Description";
            type = "Default Type";
            method = "Default Method";
            return;
        }

        ResultSetContainer.ResultSetRow rsr = rsc.getRow(row);

        log.debug("Making the PaymentHeader");
        id = TCData.getTCLong(rsr, "payment_id", 0, true);
        recentStatus = TCData.getTCString(rsr, "payment_status_desc", "default status", true);
        recentStatusId = TCData.getTCInt(rsr, "payment_status_id", 0, true);
        try {
            currentStatus = PaymentStatusFactory.createStatus((long)recentStatusId);
            long recentReasonId = TCData.getTCLong(rsr, "payment_status_reason_id", 0, true);
            if (recentReasonId != 0) {
                currentStatus.getReasons().add(PaymentStatusReason.getStatusReasonUsingId(recentReasonId));
            }
        } catch (InvalidStatusException e) {
            e.printStackTrace();
        } catch (InvalidStatusReasonException e) {
            e.printStackTrace();
        }
        recentGrossAmount = TCData.getTCDouble(rsr, "gross_amount", 0.0, true);
        recentNetAmount = TCData.getTCDouble(rsr, "net_amount", 0.0, true);
        description = TCData.getTCString(rsr, "payment_desc", "default description", true);
        type = TCData.getTCString(rsr, "payment_type_desc", "default type description", true);
        typeId = TCData.getTCInt(rsr, "payment_type_id", 0, true);
        method = TCData.getTCString(rsr, "payment_method_desc", "default method description", true);
        methodId = TCData.getTCLong(rsr, "payment_method_id", 1, true);
        if (rsr.isValidColumn("first_name")) {
            user = new UserProfileHeader(
                    TCData.getTCLong(rsr, "user_id", 0, true),
                    TCData.getTCString(rsr, "handle", "default handle", true),
                    TCData.getTCString(rsr, "first_name", "", true),
                    TCData.getTCString(rsr, "middle_name", "", true),
                    TCData.getTCString(rsr, "last_name", "", true));
        } else {
            user = new UserProfileHeader(
                    TCData.getTCLong(rsr, "user_id", 0, true),
                    TCData.getTCString(rsr, "handle", "default handle", true));
        }

        client = TCData.getTCString(rsr, "client_name", "", false);
        cockpitProjectName = TCData.getTCString(rsr, "cockpit_project_name", "", false);
        billingAccountName = TCData.getTCString(rsr, "billing_account_name", "", false);
        invoiceNumber = TCData.getTCString(rsr, "invoice_number", "", false);
        jiraIssueName = TCData.getTCString(rsr, "jira_issue_id", "", false);

        algorithmRoundId = TCData.getTCLong(rsr, "algorithm_round_id", 0, false);
        componentProjectId = TCData.getTCLong(rsr, "component_project_id", 0, false);
        contestCategoryName = TCData.getTCString(rsr, "project_category_name", "", false);

        algorithmProblemId = TCData.getTCLong(rsr, "algorithm_problem_id", 0, false);
        studioContestId = TCData.getTCLong(rsr, "studio_contest_id", 0, false);
        componentContestId = TCData.getTCLong(rsr, "component_contest_id", 0, false);
        digitalRunStageId = TCData.getTCLong(rsr, "digital_run_stage_id", 0, false);
        digitalRunSeasonId = TCData.getTCLong(rsr, "digital_run_season_id", 0, false);
        parentPaymentId = TCData.getTCLong(rsr, "parent_payment_id", 0, false);
        digitalRunTrackId = TCData.getTCLong(rsr, "digital_run_track_id", 0, false);

        createDate = TCData.getTCDate(rsr, "create_date", "00/00/00", false);
        modifyDate = TCData.getTCDate(rsr, "modify_date", "00/00/00", false);
    }

/* Constructor
*
*  Expects PAYMENT_HEADER_LIST as above and
*  Assumes the row is 0
*
*/
    public PaymentHeader(Map results) {
        this(results, 0);
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public UserProfileHeader getUser() {
        return user;
    }

    public void setUser(UserProfileHeader user) {
        this.user = user;
    }

    public String getRecentStatus() {
        return recentStatus;
    }

    public void setRecentStatus(String recentStatus) {
        this.recentStatus = recentStatus;
    }

    public double getRecentNetAmount() {
        return recentNetAmount;
    }

    public void setRecentNetAmount(double recentNetAmount) {
        this.recentNetAmount = recentNetAmount;
    }

    public double getRecentGrossAmount() {
        return recentGrossAmount;
    }

    public void setRecentGrossAmount(double recentGrossAmount) {
        this.recentGrossAmount = recentGrossAmount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public int getRecentStatusId() {
        return recentStatusId;
    }

    public void setRecentStatusId(int recentStatusId) {
        this.recentStatusId = recentStatusId;
    }

    public BasePaymentStatus getCurrentStatus() {
        return currentStatus;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public long getMethodId() {
        return methodId;
    }

    public void setMethodId(long methodId) {
        this.methodId = methodId;
    }


    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public String getCockpitProjectName() {
        return cockpitProjectName;
    }

    public void setCockpitProjectName(String cockpitProjectName) {
        this.cockpitProjectName = cockpitProjectName;
    }

    public String getBillingAccountName() {
        return billingAccountName;
    }

    public void setBillingAccountName(String billingAccountName) {
        this.billingAccountName = billingAccountName;
    }

    public long getAlgorithmProblemId() {
        return algorithmProblemId;
    }

    public void setAlgorithmProblemId(long algorithmProblemId) {
        this.algorithmProblemId = algorithmProblemId;
    }

    public long getAlgorithmRoundId() {
        return algorithmRoundId;
    }

    public void setAlgorithmRoundId(long algorithmRoundId) {
        this.algorithmRoundId = algorithmRoundId;
    }

    public long getComponentContestId() {
        return componentContestId;
    }

    public void setComponentContestId(long componentContestId) {
        this.componentContestId = componentContestId;
    }

    public long getComponentProjectId() {
        return componentProjectId;
    }

    public void setComponentProjectId(long componentProjectId) {
        this.componentProjectId = componentProjectId;
    }

    public long getDigitalRunSeasonId() {
        return digitalRunSeasonId;
    }

    public void setDigitalRunSeasonId(long digitalRunSeasonId) {
        this.digitalRunSeasonId = digitalRunSeasonId;
    }

    public long getDigitalRunStageId() {
        return digitalRunStageId;
    }

    public void setDigitalRunStageId(long digitalRunStageId) {
        this.digitalRunStageId = digitalRunStageId;
    }

    public long getDigitalRunTrackId() {
        return digitalRunTrackId;
    }

    public void setDigitalRunTrackId(long digitalRunTrackId) {
        this.digitalRunTrackId = digitalRunTrackId;
    }

    public long getStudioContestId() {
        return studioContestId;
    }

    public void setStudioContestId(long studioContestId) {
        this.studioContestId = studioContestId;
    }

    public long getParentPaymentId() {
        return parentPaymentId;
    }

    public void setParentPaymentId(long parentReferenceId) {
        this.parentPaymentId = parentReferenceId;
    }

    public long getReferenceId() {
        switch(BasePayment.getReferenceTypeId(typeId)) {
        case REFERENCE_ALGORITHM_ROUND_ID : return algorithmRoundId;
        case REFERENCE_COMPONENT_PROJECT_ID : return componentProjectId;
        case REFERENCE_ALGORITHM_PROBLEM_ID : return algorithmProblemId;
        case REFERENCE_STUDIO_CONTEST_ID : return studioContestId != 0 ? studioContestId : componentProjectId;
        case REFERENCE_COMPONENT_CONTEST_ID :return componentContestId;
        case REFERENCE_DIGITAL_RUN_STAGE_ID : return digitalRunStageId;
        case REFERENCE_DIGITAL_RUN_SEASON_ID : return digitalRunSeasonId;
        case REFERENCE_PARENT_PAYMENT_ID : return parentPaymentId;
        case REFERENCE_DIGITAL_RUN_TRACK_ID : return digitalRunTrackId;
        }
        return 0;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(String modifyDate) {
        this.modifyDate = modifyDate;
    }

    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }

    public String getJiraIssueName() {
        return jiraIssueName;
    }

    public void setJiraIssueName(String jiraIssueName) {
        this.jiraIssueName = jiraIssueName;
    }

    public String getContestCategoryName() {
        return contestCategoryName;
    }

    public void setContestCategoryName(String contestCategoryName) {
        this.contestCategoryName = contestCategoryName;
    }

}
