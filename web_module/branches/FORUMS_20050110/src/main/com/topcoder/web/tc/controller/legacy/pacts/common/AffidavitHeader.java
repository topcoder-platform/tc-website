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

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

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
    public long _id;
    public String _status;
    public UserProfileHeader _user;
    public boolean _notarized;
    public boolean _affirmed;
    public String _creationDate;
    public int _statusID;
    public String _type;
    public int _typeID;
    public String _description;

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
        _id = 0;
        _status = "Default Status";
        _user = new UserProfileHeader();
        _notarized = false;
        _affirmed = false;
        _creationDate = "00/00/00";
        _statusID = 0;
        _type = "default type";
        _typeID = 0;
        _description = "default description";
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
        _id = TCData.getTCLong(rsr, "affidavit_id", 0, true);
        _status = TCData.getTCString(rsr, "status_desc", "default status", true);
        _statusID = TCData.getTCInt(rsr, "status_id", 0, true);
        _user = new UserProfileHeader(
                TCData.getTCLong(rsr, "user_id", 0, true),
                TCData.getTCString(rsr, "handle", "default handle", true));
        _notarized = (0 != TCData.getTCInt(rsr, "notarized", 0, true));
        _affirmed = (0 != TCData.getTCInt(rsr, "affirmed", 0, true));
        _creationDate = TCData.getTCDate(rsr, "date_created", "00/00/00", true);
        _type = TCData.getTCString(rsr, "affidavit_type_desc", "default affidavit type", true);
        _typeID = TCData.getTCInt(rsr, "affidavit_type_id", 0, true);
        _description = TCData.getTCString(rsr, "affidavit_desc", "default description", true);
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

}
