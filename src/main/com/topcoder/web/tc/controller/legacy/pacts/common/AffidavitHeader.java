/******************************************************************************\
 *
 * File:          AffidavitHeader.java
 * Creation date: March 05, 2002 10:19
 * Author:        Matt Murphy
 * Purpose:       Store most common information requested about an affidavit
 * See:           UserProfileHeader.java
 *                ResultSetContainer.java
 *
 * DBP 3/26 - Implement serializable, change type id to int
 * DBP 6/6 - Move description to header
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

public class AffidavitHeader implements PactsConstants, java.io.Serializable {

    private static Logger log = Logger.getLogger(AffidavitHeader.class);
/*  Explanation of Members
*
*  _id           - DB id of the affidavit
*  _status       - status description of the affidavit
*  _user         - TC member for this affidavit
*  _affirmed     - if the affidavit is affirmed or not
*  _notarized    - if the affidavit is notarized or not
*  _creationDate - date the affidavit was entered
*/
    private long id;
    private String statusDesc;
    private UserProfileHeader user;
    private boolean notarized;
    private boolean affirmed;
    private String creationDate;
    private int statusId;
    private String typeDesc;
    private int typeId;
    private String description;

    /**************\
     *              *
     * Constructors *
     *              *
     \**************/

/* Basic constructor that sets all the default values and such
*
*  @ARGS none
*/
    public AffidavitHeader() {
        setDefaultFields();
    }

    public void setDefaultFields() {
        id = 0;
        statusDesc = "Default Status";
        user = new UserProfileHeader();
        notarized = false;
        affirmed = false;
        creationDate = "00/00/00";
        statusId = 0;
        typeDesc = "default type";
        typeId = 0;
        description = "default description";
    }

/* This constructor makes the object out of the Map containing
*  the ResultSetContainer with the constant name of AFFIDAVIT_HEADER_LIST
*
*  @ARGS
*   o Map results - the map containing AFFIDAVIT_HEADER_LIST
*   o int row     - the row in the RSC in which to find info for this AffidavitHeader
*
*/
    public AffidavitHeader(Map results, int row) {
        ResultSetContainer rsc = (ResultSetContainer) results.get(AFFIDAVIT_HEADER_LIST);
        if (rsc == null) {
            log.error("There is no " + AFFIDAVIT_HEADER_LIST + " in the ResultSetContainer");
            setDefaultFields();
            return;
        }

        int numRows = rsc.getRowCount();
        if (numRows <= row || row < 0) {
            log.error("Bad row number: " + row);
            setDefaultFields();
            return;
        }

        ResultSetContainer.ResultSetRow rsr = rsc.getRow(row);

        log.debug("Making the AffidavitHeader");
        id = TCData.getTCLong(rsr, "affidavit_id", 0, true);
        statusDesc = TCData.getTCString(rsr, "status_desc", "default status", true);
        statusId = TCData.getTCInt(rsr, "status_id", 0, true);
        user = new UserProfileHeader(
                TCData.getTCLong(rsr, "user_id", 0, true),
                TCData.getTCString(rsr, "handle", "default handle", true));
        notarized = (0 != TCData.getTCInt(rsr, "notarized", 0, true));
        affirmed = (0 != TCData.getTCInt(rsr, "affirmed", 0, true));
        creationDate = TCData.getTCDate(rsr, "date_created", "00/00/00", true);
        typeDesc = TCData.getTCString(rsr, "affidavit_type_desc", "default affidavit type", true);
        typeId = TCData.getTCInt(rsr, "affidavit_type_id", 0, true);
        description = TCData.getTCString(rsr, "affidavit_desc", "default description", true);
    }

/* This constructor makes the object out of the Map containing
*  the ResultSetContainer with the constant name of AFFIDAVIT_HEADER_LIST
*  as above and assumes the row is 0
*
*  @ARGS
*   o Map results - the map containing AFFIDAVIT_HEADER
*
*/
    public AffidavitHeader(Map results) {
        this(results, 0);
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getStatusDesc() {
        return statusDesc;
    }

    public void setStatusDesc(String statusDesc) {
        this.statusDesc = statusDesc;
    }

    public UserProfileHeader getUser() {
        return user;
    }

    public void setUser(UserProfileHeader user) {
        this.user = user;
    }

    public boolean isNotarized() {
        return notarized;
    }

    public void setNotarized(boolean notarized) {
        this.notarized = notarized;
    }

    public boolean isAffirmed() {
        return affirmed;
    }

    public void setAffirmed(boolean affirmed) {
        this.affirmed = affirmed;
    }

    public String getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(String creationDate) {
        this.creationDate = creationDate;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getTypeDesc() {
        return typeDesc;
    }

    public void setTypeDesc(String typeDesc) {
        this.typeDesc = typeDesc;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}
