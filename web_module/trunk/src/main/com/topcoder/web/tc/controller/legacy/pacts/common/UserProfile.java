/******************************************************************************\
 *
 * File:          UserProfile.cpp
 * Creation date: March 05, 2002 10:19
 * Author:        Matt Murphy
 * Purpose:       Store information about a given TC member
 * See:           UserProfileHeader.java
 *                ResultSetContainer.java
 *
 * Modifications: @INSERT_MODIFICATIONS(* )
 * March 05, 2002 10:19 Matt Murphy
 *     Added member '_header'
 *     Added member '_email'
 *     Added member '_workPhone'
 *     Added member '_homePhone'
 *     Added member '_country'
 *     Added member '_zip'
 *     Added member '_state'
 *     Added member '_city'
 *     Added member '_address2'
 *     Added member '_address1'
 *     Added member '_middleName'
 *     Added member '_firstName'
 *     Added member '_lastName'
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

public class UserProfile implements PactsConstants, java.io.Serializable {
    private static Logger log = Logger.getLogger(UserProfile.class);

    public UserProfileHeader _header;
    public String _email;
    public String _workPhone;
    public String _homePhone;
    public String _country;
    public String _zip;
    public String _state;
    public String _city;
    public String _address1;
    public String _address2;
    public String _middleName;
    public String _firstName;
    public String _lastName;
    public String _stateCode;
    public String _countryCode;
    public int _coderTypeId;
    public String _coderTypeDesc;

    /**
     * this constructor takes in a result set map, and
     * will fill in the data structure appropriately.  If there is an
     * error, default values will be used.  There should only be
     * one UserProfile and one UserProfileHeader in this result set.
     *
     * @param resutls the result set map from the db query
     */
    public UserProfile(Map results) {
        ResultSetContainer rsc = null;
        try {
            rsc = (ResultSetContainer) results.get(USER_PROFILE_DETAIL);
        } catch (Exception e1) {
            log.error("there was an excpetion trying to parse the results in const");
            setDefaults();
            e1.printStackTrace();
            return;
        }

        // check if it was there
        if (rsc == null) {
            log.error("The result map did not contain " + USER_PROFILE_DETAIL);
            setDefaults();
            return;
        }

        // make sure the row is valid
        if (rsc.getRowCount() < 0) {
            log.error("the result set container for " + USER_PROFILE_DETAIL + "had");
            log.error("no datat in it");
            setDefaults();
            return;
        }

        if (rsc.getRowCount() != 1) {
            log.error("There should only be one payment");
        }

        // now fill up the data structure
        ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);

        try {
            _email = TCData.getTCString(rRow, "email");
            _workPhone = TCData.getTCString(rRow, "work_phone");
            _homePhone = TCData.getTCString(rRow, "home_phone");
            _lastName = TCData.getTCString(rRow, "last_name");
            _firstName = TCData.getTCString(rRow, "first_name");
            _middleName = TCData.getTCString(rRow, "middle_name");
            _address1 = TCData.getTCString(rRow, "address1");
            _address2 = TCData.getTCString(rRow, "address2");
            _city = TCData.getTCString(rRow, "city");
            _state = TCData.getTCString(rRow, "state_name");
            _zip = TCData.getTCString(rRow, "zip");
            _country = TCData.getTCString(rRow, "country_name");
            _stateCode = TCData.getTCString(rRow, "state_code");
            _countryCode = TCData.getTCString(rRow, "country_code");
            _coderTypeId = TCData.getTCInt(rRow, "coder_type_id");
            _coderTypeDesc = TCData.getTCString(rRow, "coder_type_desc");

            _header = new UserProfileHeader(results);
        } catch (Exception e) {
            log.error("there was an exception in the user profile contructor");
            setDefaults();
            e.printStackTrace();
        }
    }


    /**
     * default constructor, sets all values to defaults
     */
    public UserProfile() {
        setDefaults();
    }

    /**
     * the method that actually sets the defaults
     */
    private void setDefaults() {
        _header = new UserProfileHeader();
        _email = "default@topcoder.com";
        _workPhone = "(000) 000-0000";
        _homePhone = "(000) 000-0000";
        _country = "Default Country";
        _zip = "00000";
        _state = "Default State";
        _city = "Default City";
        _address1 = "Default Address 1";
        _address2 = "Default Address 2";
        _middleName = "Middle";
        _firstName = "First";
        _lastName = "Last";
        _coderTypeId = -1;
        _coderTypeDesc = "default coder desc";
    }

}
