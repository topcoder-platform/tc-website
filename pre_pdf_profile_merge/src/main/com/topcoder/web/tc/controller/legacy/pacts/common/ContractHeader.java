/******************************************************************************\
 *
 * File:          ContractHeader.java
 * Creation date: March 05, 2002 10:19
 * Author:        Matt Murphy
 * Purpose:       Store the more commonly requested info of a contract
 * See:           UserProfileHeader.java
 *                ResultSetContainer.java
 *
 * Modifications: @INSERT_MODIFICATIONS(* )
 * March 05, 2002 10:19 Matt Murphy
 *     Added member '_status'
 *     Added member '_creationDate'
 *     Added member '_name'
 *     Added member '_user'
 *     Added member '_id'
 *
 * STK 3/19/2002
 * Added the Map constructor
 *
 * DBP 3/20 - Change path to ResultSetContainer - now in com.topcoder.web.common
 * DBP 3/26 - Implement serializable, change type id to int
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

/**
 * contract header wrapper
 */
public class ContractHeader implements PactsConstants, java.io.Serializable {
    private static Logger log = Logger.getLogger(ContractHeader.class);

    public String _statusDesc;
    public int _statusId;
    public String _creationDate;
    public String _name;
    public UserProfileHeader _user;
    public long _id;
    public String _type;
    public int _typeID;


    /**
     * basic constructor, sets all values to default values
     */
    public ContractHeader() {
        setDefaults();
    }

    /**
     * helper function used to set values to defaults.  Used if a
     * constructor gets an error.
     */
    private void setDefaults() {
        _statusDesc = "Default Status";
        _creationDate = "00/00/00";
        _name = "Default Contract Name";
        _user = new UserProfileHeader();
        _id = 0;
        _statusId = 0;
        _type = "Default Contract Type";
        _typeID = 0;
    }

    /**
     * this is used to set the contract header when passed a result map
     * by a dipatch bean.  The dispatch bean would have gotten the
     * map as a result of a db query.  If an error occurs, the
     * values will fall back to defaults.
     *
     *
     * @param results the result map from the dipatch bean
     * @param row the row in the specific result set container for this
     *        object.
     * @see UserProfileHeader
     */
    public ContractHeader(Map results, int row) {
        ResultSetContainer rsc = (ResultSetContainer) results.get(CONTRACT_HEADER_LIST);

        // check if it was there
        if (rsc == null) {
            log.error("The result map did not contain " + CONTRACT_HEADER_LIST);
            setDefaults();
            return;
        }

        // make sure the row is valid
        if ((rsc.getRowCount() <= row) || (row < 0)) {
            log.error("the result set container for " + CONTRACT_HEADER_LIST +
                    " hads " + rsc.getRowCount() + " rows and was passed" +
                    row + " rows in the contructor");
            setDefaults();
            return;
        }

        // now fill up the data structure
        ResultSetContainer.ResultSetRow rRow = rsc.getRow(row);

        try {
            _id = TCData.getTCLong(rRow, "contract_id");
            _statusDesc = TCData.getTCString(rRow, "status_desc");
            _statusId = TCData.getTCInt(rRow, "status_id");
            _name = TCData.getTCString(rRow, "name");
            String handle = TCData.getTCString(rRow, "handle");
            long uid = TCData.getTCLong(rRow, "contracted_user_id");
            _user = new UserProfileHeader(uid, handle);
            _type = TCData.getTCString(rRow, "contract_type_desc");
            _typeID = TCData.getTCInt(rRow, "contract_type_id");
            _creationDate = TCData.getTCDate(rRow, "creation_date");
        } catch (Exception e) {
            log.error("There was an exeption in the contructor of the\n" +
                    "ContractHeader, all values are being set to defaults");
            setDefaults();
            e.printStackTrace();
            return;
        }
    }

    /**
     * will parse the results out of the results map and assume that row
     * 0 is of intrest
     *
     * @param results the result map from the dipatch bean
     */
    public ContractHeader(Map results) {
        this(results, 0);
    }
}
