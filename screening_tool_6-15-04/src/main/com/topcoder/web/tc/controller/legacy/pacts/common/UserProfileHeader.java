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
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
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
    public long _id;
    public String _handle;
    public long _groupID[];
    public String _last;
    public String _middle;
    public String _first;

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
        _id = 0;
        _handle = "Default TC Member";
        _groupID = new long[0];
    }

/* This constructor makes the object out of raw data.
*
*  @ARGS
*   o id       - DB id of the TC member
*   o handle   - handle of the TC member
*
*/
    public UserProfileHeader(long id, String handle) {
        _id = id;
        _handle = handle;
        _last = "";
        _middle = "";
        _first = "";
        _groupID = new long[0];
    }


/* This constructor makes the object out of a Navigation object.
*
*  @ARGS
*   o nav - The Navigation Object
*
*/
    public UserProfileHeader(Navigation nav) throws Exception {
        if (nav.isIdentified()) {
            _id = nav.getUserId();
            log.debug("UPH - Have nav object.");
            DataInterfaceBean bean = new DataInterfaceBean();
            Map results = bean.getUserProfileHeader(_id);
            ResultSetContainer rsc = (ResultSetContainer) (results.get(USER_PROFILE_HEADER_LIST));
            int rowCount = rsc.getRowCount();
            if (rowCount < 1) {
                log.debug("UPH - Couldn't find user by that user_id");
                _id = 0;
                _handle = "Default TC Member";
                _last = "";
                _middle = "";
                _first = "";
                _groupID = new long[0];
                return;
            }
            ResultSetContainer.ResultSetRow row = rsc.getRow(0);
            _id = TCData.getTCLong(row, "user_id", 0, true);
            _handle = TCData.getTCString(row, "handle", "default handle", true);
            _last = TCData.getTCString(row, "last_name", "", false);
            _middle = TCData.getTCString(row, "middle_name", "", false);
            _first = TCData.getTCString(row, "first_name", "", false);
            rsc = (ResultSetContainer) (results.get(USER_GROUP_LIST));
            rowCount = rsc.getRowCount();
            _groupID = new long[rowCount];
            for (int n = 0; n < rowCount; n++) {
                log.debug("UPH - Adding group");
                row = rsc.getRow(n);
                _groupID[n] = TCData.getTCLong(row, "group_id", 0, true);
            }
        } else {
            _id = 0;
            _handle = "Default TC Member";
            _last = "";
            _middle = "";
            _first = "";
            _groupID = new long[0];
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
            _id = 0;
            _handle = "Default TC Member";
            _last = "";
            _middle = "";
            _first = "";
            _groupID = new long[0];
            return;
        }
        ResultSetContainer.ResultSetRow rsr = rsc.getRow(row);
        _id = TCData.getTCLong(rsr, "user_id", 0, true);
        _handle = TCData.getTCString(rsr, "handle", "default handle", true);
        _last = TCData.getTCString(rsr, "last_name", "", false);
        _middle = TCData.getTCString(rsr, "middle_name", "", false);
        _first = TCData.getTCString(rsr, "first_name", "", false);
        _groupID = new long[0];
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
            _id = 0;
            _handle = "Default TC Member";
            _last = "";
            _middle = "";
            _first = "";
            _groupID = new long[0];
            return;
        }

        ResultSetContainer.ResultSetRow rsr = rsc.getRow(0);
        _id = TCData.getTCLong(rsr, "user_id", 0, true);
        _handle = TCData.getTCString(rsr, "handle", "default handle", true);
        _last = TCData.getTCString(rsr, "last_name", "", false);
        _middle = TCData.getTCString(rsr, "middle_name", "", false);
        _first = TCData.getTCString(rsr, "first_name", "", false);
        _groupID = new long[0];

        ResultSetContainer.ResultSetRow row;

        rsc = (ResultSetContainer) (map.get(USER_GROUP_LIST));
        if (rsc != null) {
            rowCount = rsc.getRowCount();
            _groupID = new long[rowCount];
            for (int n = 0; n < rowCount; n++) {
                log.debug("UPH - Adding group");
                row = rsc.getRow(n);
                _groupID[n] = TCData.getTCLong(row, "group_id", 0, true);
            }
        } else
            _groupID = new long[0];
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
        for (int n = 0; n < _groupID.length; n++) {
            if (_groupID[n] == TC_STAFF) return true;
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
        for (int n = 0; n < _groupID.length; n++) {
            if (_groupID[n] == TC_MEMBER) return true;
        }
        return false;
    }

}
