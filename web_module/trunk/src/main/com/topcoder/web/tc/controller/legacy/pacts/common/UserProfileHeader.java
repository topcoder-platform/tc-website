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
 * Copyright 2002, TopCoder, Inc
 * All rights are reserved. Reproduction in whole or part is prohibited
 * without the written consent of the copyright owner.
 *
 \******************************************************************************/

package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

import java.util.Map;

public class UserProfileHeader implements PactsConstants, java.io.Serializable {
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
    }


/* This constructor makes the object out of a Navigation object.
*
*  @ARGS
*   o nav - The Navigation Object
*
*/
    public UserProfileHeader(Navigation nav) throws Exception {
        if (nav.isIdentified()) {
            id = nav.getUserId();
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
                return;
            }
            ResultSetContainer.ResultSetRow row = rsc.getRow(0);
            id = TCData.getTCLong(row, "user_id", 0, true);
            handle = TCData.getTCString(row, "handle", "default handle", true);
            last = TCData.getTCString(row, "last_name", "", false);
            middle = TCData.getTCString(row, "middle_name", "", false);
            first = TCData.getTCString(row, "first_name", "", false);
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
            return;
        }
        ResultSetContainer.ResultSetRow rsr = rsc.getRow(row);
        id = TCData.getTCLong(rsr, "user_id", 0, true);
        handle = TCData.getTCString(rsr, "handle", "default handle", true);
        last = TCData.getTCString(rsr, "last_name", "", false);
        middle = TCData.getTCString(rsr, "middle_name", "", false);
        first = TCData.getTCString(rsr, "first_name", "", false);
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
            groupId = new long[0];
            return;
        }

        ResultSetContainer.ResultSetRow rsr = rsc.getRow(0);
        id = TCData.getTCLong(rsr, "user_id", 0, true);
        handle = TCData.getTCString(rsr, "handle", "default handle", true);
        last = TCData.getTCString(rsr, "last_name", "", false);
        middle = TCData.getTCString(rsr, "middle_name", "", false);
        first = TCData.getTCString(rsr, "first_name", "", false);
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


}
