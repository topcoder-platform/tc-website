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

    protected UserProfileHeader header;
    protected String email;
    protected String workPhone;
    protected String homePhone;
    protected String country;
    protected String zip;
    protected String state;
    protected String city;
    protected String address1;
    protected String address2;
    protected String middleName;
    protected String firstName;
    protected String lastName;
    protected String stateCode;
    protected String countryCode;
    protected int coderTypeId;
    protected String coderTypeDesc;

    /**
     * this constructor takes in a result set map, and
     * will fill in the data structure appropriately.  If there is an
     * error, default values will be used.  There should only be
     * one UserProfile and one UserProfileHeader in this result set.
     *
     * @param results the result set map from the db query
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
            email = TCData.getTCString(rRow, "email");
            workPhone = TCData.getTCString(rRow, "work_phone");
            homePhone = TCData.getTCString(rRow, "home_phone");
            lastName = TCData.getTCString(rRow, "last_name");
            firstName = TCData.getTCString(rRow, "first_name");
            middleName = TCData.getTCString(rRow, "middle_name");
            address1 = TCData.getTCString(rRow, "address1");
            address2 = TCData.getTCString(rRow, "address2");
            city = TCData.getTCString(rRow, "city");
            state = TCData.getTCString(rRow, "state_name");
            zip = TCData.getTCString(rRow, "zip");
            country = TCData.getTCString(rRow, "country_name");
            stateCode = TCData.getTCString(rRow, "state_code");
            countryCode = TCData.getTCString(rRow, "country_code");
            coderTypeId = TCData.getTCInt(rRow, "coder_type_id");
            coderTypeDesc = TCData.getTCString(rRow, "coder_type_desc");

            header = new UserProfileHeader(results);
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
        header = new UserProfileHeader();
        email = "default@topcoder.com";
        workPhone = "(000) 000-0000";
        homePhone = "(000) 000-0000";
        country = "Default Country";
        zip = "00000";
        state = "Default State";
        city = "Default City";
        address1 = "Default Address 1";
        address2 = "Default Address 2";
        middleName = "Middle";
        firstName = "First";
        lastName = "Last";
        coderTypeId = -1;
        coderTypeDesc = "default coder desc";
    }


    public UserProfileHeader getHeader() {
        return header;
    }

    public void setHeader(UserProfileHeader header) {
        this.header = header;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getWorkPhone() {
        return workPhone;
    }

    public void setWorkPhone(String workPhone) {
        this.workPhone = workPhone;
    }

    public String getHomePhone() {
        return homePhone;
    }

    public void setHomePhone(String homePhone) {
        this.homePhone = homePhone;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getStateCode() {
        return stateCode;
    }

    public void setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public int getCoderTypeId() {
        return coderTypeId;
    }

    public void setCoderTypeId(int coderTypeId) {
        this.coderTypeId = coderTypeId;
    }

    public String getCoderTypeDesc() {
        return coderTypeDesc;
    }

    public void setCoderTypeDesc(String coderTypeDesc) {
        this.coderTypeDesc = coderTypeDesc;
    }


}
