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

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

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
*/
    public long _id;
    public UserProfileHeader _user;
    public String _recentStatus;
    public double _recentNetAmount;
    public double _recentGrossAmount;
    public String _description;
    public String _type;
    public int _recentStatusID;
    public int _typeID;
    public boolean _reviewed;

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
        _id = 0;
        _user = new UserProfileHeader();
        _recentStatus = "Default Status";
        _recentNetAmount = 0;
        _description = "Default Description";
        _type = "Default Type";
        _recentStatusID = 0;
        _typeID = 0;
        _reviewed = false;
    }

/* This constructor makes the object out of raw data.
*  DEPRECIATED -- WILL BE REMOVED UNLESS I AM NOTIFIED (Matt)
*
*  @ARGS
*   o id          - the DB id of the payment details
*   o userID      - the DB id of the TC member
*   o handle      - the handle of the TC member
*   o groupID[]    - the group number of the TC member
*   o status      - the most recent status of the payment
*   o netAmount   - the current net amount of the payment
*   o description - the description of the payment
*   o type        - type of the payment
*
*/
    public PaymentHeader(long id, long userID, String handle, long groupID[],
                         String status, double netAmount, String description, String type) {

        _id = id;
        _user = new UserProfileHeader(userID, handle);
        _recentStatus = status;
        _recentNetAmount = netAmount;
        _description = description;
        _type = type;
    }

/* This constructor makes the object out of raw data & headers.
*  DEPRECIATED -- WILL BE REMOVED UNLESS I AM NOTIFIED (Matt)
*
*  @ARGS
*   o id          - the DB id of the payment details
*   o user        - UserProfileHeader
*   o status      - the most recent status of the payment
*   o netAmount   - the current net amount of the payment
*   o description - the description of the payment
*   o type        - type of the payment
*
*/
    public PaymentHeader(long id, UserProfileHeader user,
                         String status, double netAmount, String description, String type) {

        _id = id;
        _user = user;
        _recentStatus = status;
        _recentNetAmount = netAmount;
        _description = description;
        _type = type;
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
            _id = 0;
            _user = new UserProfileHeader();
            _recentStatus = "Default Status";
            _recentNetAmount = 0;
            _description = "Default Description";
            _type = "Default Type";
            _reviewed = false;
            return;
        }

        int numRows = rsc.getRowCount();
        if (numRows <= row || row < 0) {
            log.error("Bad row number: " + row);
            _id = 0;
            _user = new UserProfileHeader();
            _recentStatus = "Default Status";
            _recentNetAmount = 0;
            _description = "Default Description";
            _type = "Default Type";
            _reviewed = false;
            return;
        }

        ResultSetContainer.ResultSetRow rsr = rsc.getRow(row);

        log.debug("Making the PaymentHeader");
        _id = TCData.getTCLong(rsr, "payment_id", 0, true);
        _recentStatus = TCData.getTCString(rsr, "status_desc", "default status", true);
        _recentStatusID = TCData.getTCInt(rsr, "status_id", 0, true);
        _recentGrossAmount = TCData.getTCDouble(rsr, "gross_amount", 0.0, true);
        _recentNetAmount = TCData.getTCDouble(rsr, "net_amount", 0.0, true);
        _description = TCData.getTCString(rsr, "payment_desc", "default description", true);
        _type = TCData.getTCString(rsr, "payment_type_desc", "default type description", true);
        _typeID = TCData.getTCInt(rsr, "payment_type_id", 0, true);
        _user = new UserProfileHeader(
                TCData.getTCLong(rsr, "user_id", 0, true),
                TCData.getTCString(rsr, "handle", "default handle", true));
        _reviewed = 0 != TCData.getTCInt(rsr, "review", 0, true);
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
}
