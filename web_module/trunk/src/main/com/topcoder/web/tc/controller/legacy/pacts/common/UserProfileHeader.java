/******************************************************************************\
 *
 * File:          UserProfileHeader.java
 * Creation date: March 05, 2002 10:19
 * Author:        Matt Murphy
 * Purpose:       Stores most commonly requested information about a TC member
 * See:           ResultSetContainer.java
 *
 * DBP 3/26 - Implement serializable
 *
 * Copyright (C) 2002-2010 TopCoder Inc., All Rights Reserved.
 * All rights are reserved. Reproduction in whole or part is prohibited
 * without the written consent of the copyright owner.
 *
 \******************************************************************************/

package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

import java.util.Map;

/**
 * <p>A simple <code>DTO</code> providing the basic details for user profile. As of current version such details include
 * ID, handle, first, last and middle names, payment accrual amount, list of group IDs and current user profile status.
 * </p>
 *
 * <p>
 *   Version 1.1 (Member Payment Improvements Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added new private field <code>status</code> with respective accessor and mutator methods.</li>
 *     <li>Updated constructors to initialize newly added <code>status</code> private field.</li>
 *     <li>Updated <code>serialVersionUID</code> static field.</p> 
 *   </ol>
 * </p>
 *
 * <p>VERY IMPORTANT: remember to update serialVersionUID if needed.</p>
 *
 * @author veredox, isv
 * @version 1.1
 */
public class UserProfileHeader implements PactsConstants, java.io.Serializable {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    private static Logger log = Logger.getLogger(UserProfileHeader.class);

/*  Explanation of Members
*
*   _id      - DB id of the user profile
*   _handle  - handle of the TC member
*   _groupID[] - group numbers of the TC member
*/
    private long id;
    private String handle;
    private long groupId[];
    private String last;
    private String middle;
    private String first;
    private double accrualAmount;
    private String paymentMethod;

    /**
     * <p>A <code>String</code> providing the name for the current user profile status.</p>
     *
     * @since 1.1
     */
    private String status;

    /**************\
     *              *
     * Constructors *
     *              *
     \**************/

/* Basic constructor that sets all the default values and such
*
*  @ARGS none
*/
    public UserProfileHeader() {
        id = 0;
        handle = "Default TC Member";
        groupId = new long[0];
        accrualAmount = 0;
        status = "";
        paymentMethod = "";
    }

/* This constructor makes the object out of raw data.
*
*  @ARGS
*   o id       - DB id of the TC member
*   o handle   - handle of the TC member
*
*/
    public UserProfileHeader(long id, String handle) {
        this.id = id;
        this.handle = handle;
        last = "";
        middle = "";
        first = "";
        groupId = new long[0];
        accrualAmount = 0;
        status = "";
        paymentMethod = "";
    }

    /* This constructor makes the object out of raw data.
    *
    *  @ARGS
    *   o id       - DB id of the TC member
    *   o handle   - handle of the TC member
    *   o last     - last name of the TC member
    *   o middle   - middle name of the TC member
    *   o first    - first name of the TC member
    */
    public UserProfileHeader(long id, String handle, String first, String middle, String last) {
        this.id = id;
        this.handle = handle;
        this.first = first;
        this.middle = middle;
        this.last = last;
        groupId = new long[0];
        accrualAmount = 0;
        status = "";
        paymentMethod = "";
    }


/* This constructor makes the object out of a Navigation object.
*
*  @ARGS
*   o nav - The Navigation Object
*
*/
    public UserProfileHeader(SessionInfo info) throws Exception {
        if (!info.isAnonymous()) {
            id = info.getUserId();
            log.debug("UPH - Have nav object.");
            DataInterfaceBean bean = new DataInterfaceBean();
            Map results = bean.getUserProfileHeader(id);
            ResultSetContainer rsc = (ResultSetContainer) (results.get(USER_PROFILE_HEADER_LIST));
            int rowCount = rsc.getRowCount();
            if (rowCount < 1) {
                log.debug("UPH - Couldn't find user by that user_id");
                id = 0;
                handle = "Default TC Member";
                last = "";
                middle = "";
                first = "";
                groupId = new long[0];
                accrualAmount = 0;
                paymentMethod = "";
                status = "";
                return;
            }
            ResultSetContainer.ResultSetRow row = rsc.getRow(0);
            id = TCData.getTCLong(row, "user_id", 0, true);
            handle = TCData.getTCString(row, "handle", "default handle", true);
            last = TCData.getTCString(row, "last_name", "", false);
            middle = TCData.getTCString(row, "middle_name", "", false);
            first = TCData.getTCString(row, "first_name", "", false);
            accrualAmount = TCData.getTCDouble(row, "accrual_amount", 0, false);
            paymentMethod = TCData.getTCString(row, "payment_method", "", false);

            if (row.isValidColumn("user_status_desc")) {
                status = TCData.getTCString(row, "user_status_desc");
            }
            rsc = (ResultSetContainer) (results.get(USER_GROUP_LIST));
            rowCount = rsc.getRowCount();
            groupId = new long[rowCount];
            for (int n = 0; n < rowCount; n++) {
                log.debug("UPH - Adding group");
                row = rsc.getRow(n);
                groupId[n] = TCData.getTCLong(row, "group_id", 0, true);
            }
        } else {
            id = 0;
            handle = "Default TC Member";
            last = "";
            middle = "";
            first = "";
            accrualAmount = 0;
            paymentMethod = "";
            status = "";
            groupId = new long[0];
        }

    }

/* This constructor uses a row from the USER_PROFILE_HEADER_LIST ResultSetContainer
*  to create the object.
*
*  @ARGS
*  o Map map - the map containing the USER_PROFILE_HEADER_LIST RSC
*  o int row - the row to use when constructing the object
*
*/
    public UserProfileHeader(Map map, int row) {
        ResultSetContainer rsc = (ResultSetContainer) map.get(USER_PROFILE_HEADER_LIST);
        int rowCount = rsc.getRowCount();
        if (rowCount <= row || row < 0) {
            id = 0;
            handle = "Default TC Member";
            last = "";
            middle = "";
            first = "";
            groupId = new long[0];
            accrualAmount = 0;
            paymentMethod = "";
            status = "";
            return;
        }
        ResultSetContainer.ResultSetRow rsr = rsc.getRow(row);
        id = TCData.getTCLong(rsr, "user_id", 0, true);
        handle = TCData.getTCString(rsr, "handle", "default handle", true);
        last = TCData.getTCString(rsr, "last_name", "", false);
        middle = TCData.getTCString(rsr, "middle_name", "", false);
        first = TCData.getTCString(rsr, "first_name", "", false);
        accrualAmount = TCData.getTCDouble(rsr, "accrual_amount", 0, false);
        paymentMethod = TCData.getTCString(rsr, "payment_method", "", false);

        if (rsr.isValidColumn("user_status_desc")) {
            status = TCData.getTCString(rsr, "user_status_desc");
        }

        groupId = new long[0];
    }

/* This constructor expects USER_PROFILE_HEADER_LIST as above
*  and assumes the row is 0
*
*  Otherwise expects USER_HEADER_SUMMARY and USER_GROUP_LIST
*
*  @ARGS
*  o Map map - the map containing the USER_PROFILE_HEADER_LIST RSC
*/
    public UserProfileHeader(Map map) {
        ResultSetContainer rsc = (ResultSetContainer) map.get(USER_PROFILE_HEADER_LIST);
        int rowCount = rsc.getRowCount();
        if (rowCount < 1) {
            id = 0;
            handle = "Default TC Member";
            last = "";
            middle = "";
            first = "";
            accrualAmount = 0;
            paymentMethod = "";
            status = "";
            groupId = new long[0];
            return;
        }

        ResultSetContainer.ResultSetRow rsr = rsc.getRow(0);
        id = TCData.getTCLong(rsr, "user_id", 0, true);
        handle = TCData.getTCString(rsr, "handle", "default handle", true);
        last = TCData.getTCString(rsr, "last_name", "", false);
        middle = TCData.getTCString(rsr, "middle_name", "", false);
        first = TCData.getTCString(rsr, "first_name", "", false);
        accrualAmount = TCData.getTCDouble(rsr, "accrual_amount", 0, false);
        paymentMethod = TCData.getTCString(rsr, "payment_method", "", false);
        status = "";
        groupId = new long[0];

        ResultSetContainer.ResultSetRow row;

        rsc = (ResultSetContainer) (map.get(USER_GROUP_LIST));
        if (rsc != null) {
            rowCount = rsc.getRowCount();
            groupId = new long[rowCount];
            for (int n = 0; n < rowCount; n++) {
                log.debug("UPH - Adding group");
                row = rsc.getRow(n);
                groupId[n] = TCData.getTCLong(row, "group_id", 0, true);
            }
        } else
            groupId = new long[0];
    }

    /******************\
     *                  *
     * Member Functions *
     *                  *
     \******************/

/* Returns whether or not the User is a Staff Member
*
*   @ARGS none
*
*/
    public boolean isTCStaff() {
        for (int n = 0; n < groupId.length; n++) {
            if (groupId[n] == TC_STAFF) return true;
        }
        return false;
    }

/* Returns whether or not the User is a Normal TC Member
*  DEPRECIATED -- WILL BE REMOVED UNLESS I AM NOTIFIED OTHERWISE (Matt)
*
*   @ARGS none
*
*/
    public boolean isTCMember() {
        for (int n = 0; n < groupId.length; n++) {
            if (groupId[n] == TC_MEMBER) return true;
        }
        return false;
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public double getAccrualAmount() {
        return accrualAmount;
    }

    public void setAccrualAmount(double accrualAmount) {
        this.accrualAmount = accrualAmount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public long[] getGroupId() {
        return groupId;
    }

    public void setGroupId(long[] groupId) {
        this.groupId = groupId;
    }

    public String getLast() {
        return last;
    }

    public void setLast(String last) {
        this.last = last;
    }

    public String getMiddle() {
        return middle;
    }

    public void setMiddle(String middle) {
        this.middle = middle;
    }

    public String getFirst() {
        return first;
    }

    public void setFirst(String first) {
        this.first = first;
    }

    public String getFullName() {
        return first + " " + last;
    }

    /**
     * <p>Gets the current user profile status.</p>
     *
     * @return a <code>String</code> providing the name for current user profile status.
     * @since 1.1
     */
    public String getStatus() {
        return this.status;
    }

    /**
     * <p>Sets the current user profile status.</p>
     *
     * @param status a <code>String</code> providing the name for current user profile status.
     * @since 1.1
     */
    public void setStatus(String status) {
        this.status = status;
    }
}
