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

    private String statusDesc;
    private int statusId;
    private String creationDate;
    private String name;
    private UserProfileHeader user;
    private long id;
    private String typeDesc;
    private int typeId;


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
        statusDesc = "Default Status";
        creationDate = "00/00/00";
        name = "Default Contract Name";
        user = new UserProfileHeader();
        id = 0;
        statusId = 0;
        typeDesc = "Default Contract Type";
        typeId = 0;
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
            id = TCData.getTCLong(rRow, "contract_id");
            statusDesc = TCData.getTCString(rRow, "status_desc");
            statusId = TCData.getTCInt(rRow, "status_id");
            name = TCData.getTCString(rRow, "name");
            String handle = TCData.getTCString(rRow, "handle");
            long uid = TCData.getTCLong(rRow, "contracted_user_id");
            user = new UserProfileHeader(uid, handle);
            typeDesc = TCData.getTCString(rRow, "contract_type_desc");
            typeId = TCData.getTCInt(rRow, "contract_type_id");
            creationDate = TCData.getTCDate(rRow, "creation_date");
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

    public String getStatusDesc() {
        return statusDesc;
    }

    public void setStatusDesc(String statusDesc) {
        this.statusDesc = statusDesc;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(String creationDate) {
        this.creationDate = creationDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public UserProfileHeader getUser() {
        return user;
    }

    public void setUser(UserProfileHeader user) {
        this.user = user;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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

}
