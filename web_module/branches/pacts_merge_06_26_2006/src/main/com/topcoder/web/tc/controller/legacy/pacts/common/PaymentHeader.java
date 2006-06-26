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

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

import java.util.Map;

public class PaymentHeader implements PactsConstants, java.io.Serializable {
    private static Logger log = Logger.getLogger(PaymentHeader.class);

/*  Explanation of Members
*
*   _id              - the DB id of the payment details
*   _user            - the TC member associated with the payment
*   _recentStatus    - status of the most recent modification
*   _recentNetAmount - current aggregate amount of the payment
*   _description     - description of the payment
*   _type            - type of payment
*   _method			 - method of payment
*   _project		 - project associated with payment
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
    private int methodId;
    private long projectId;
    private String client;
    private boolean reviewed;

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
        typeId = 0;
        methodId = 1;	// Check
        reviewed = false;
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
            reviewed = false;
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
            reviewed = false;
            return;
        }

        ResultSetContainer.ResultSetRow rsr = rsc.getRow(row);

        log.debug("Making the PaymentHeader");
        id = TCData.getTCLong(rsr, "payment_id", 0, true);
        recentStatus = TCData.getTCString(rsr, "status_desc", "default status", true);
        recentStatusId = TCData.getTCInt(rsr, "status_id", 0, true);
        recentGrossAmount = TCData.getTCDouble(rsr, "gross_amount", 0.0, true);
        recentNetAmount = TCData.getTCDouble(rsr, "net_amount", 0.0, true);
        description = TCData.getTCString(rsr, "payment_desc", "default description", true);
        type = TCData.getTCString(rsr, "payment_type_desc", "default type description", true);
        typeId = TCData.getTCInt(rsr, "payment_type_id", 0, true);
        method = TCData.getTCString(rsr, "payment_method_desc", "default method description", true);
        methodId = TCData.getTCInt(rsr, "payment_method_id", 1, true);
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
        if (typeId == COMPONENT_PAYMENT || typeId == REVIEW_BOARD_PAYMENT) {
        	projectId = TCData.getTCLong(rsr, "project_id", 0, false);
        	client = TCData.getTCString(rsr, "client", "", false);
        }
        reviewed = 0 != TCData.getTCInt(rsr, "review", 0, true);
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

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }
    
    public int getMethodId() {
        return methodId;
    }

    public void setMethodId(int methodId) {
        this.methodId = methodId;
    }
    
    public long getProjectId() {
        return projectId;
    }

    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }
    
    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public boolean isReviewed() {
        return reviewed;
    }

    public void setReviewed(boolean reviewed) {
        this.reviewed = reviewed;
    }

}
