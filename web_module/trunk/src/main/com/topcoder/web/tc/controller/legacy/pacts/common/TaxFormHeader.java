/******************************************************************************\
 *
 * File:          TaxFormHeader.java
 * Creation date: March 05, 2002 10:19
 * Author:        Matt Murphy
 * Purpose:       Store the more commonly requested information for a tax form
 * See:           UserProfileHeader.java
 *                ResultSetContainer.java
 *
 * DBP 3/26 - Implement serializable, change status id to int
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

public class TaxFormHeader implements PactsConstants, java.io.Serializable {
    private static Logger log = Logger.getLogger(TaxFormHeader.class);

/*  Explanation of Members
*
*   _status    - status of the tax form
*   _user      - TC member associated with the tax form
*   _id        - DB id of the tax form
*   _name      - name of the tax form
*   _dateFiled - date the tax form was filed
*/
    private String status;
    private int statusId;
    private UserProfileHeader user;
    private long id;
    private String name;
    private String dateFiled;

    /**************\
     *              *
     * Constructors *
     *              *
     \**************/

/* Basic constructor that sets all the default values and such
*
*  @ARGS none
*/
    public TaxFormHeader() {
        status = "Default Status";
        user = new UserProfileHeader();
        id = 0;
        name = "Default Tax Form Name";
        dateFiled = "00/00/00";
    }

/* This constructor makes the object out of raw data.
*
*  DEPRECIATED -- WILL BE REMOVED UNLESS I AM NOTIFIED OTHERWISE (Matt)
*
*  @ARGS
*   o id                    - DB id of the tax form
*   o date                  - date the tax form was filed
*   o userID                - DB id of the TC member
*   o handle                - handle of the TC member
*   o groupID[]               - groupd numbers of the TC member
*   o name                  - name of the tax form
*   o status                - status of the tax form
*
*/
    public TaxFormHeader(long id, String date, long userID, String handle,
                         long groupID[], String name, String status) {

        this.id = id;
        dateFiled = date;
        user = new UserProfileHeader(userID, handle);
        this.status = status;
        this.name = name;
    }

/* This constructor makes the object out of raw data & headers.
*
*  DEPRECIATED -- WILL BE REMOVED UNLEESS I AM NOTIFIED OTHERWISE (Matt)
*
*  @ARGS
*   o id                    - DB id of the tax form
*   o date                  - date the tax form was filed
*   o user                  - UserProfileHeader
*   o name                  - name of the tax form
*   o status                - status of the tax form
*
*/
    public TaxFormHeader(long id, String date, UserProfileHeader user,
                         String name, String status) {

        this.id = id;
        dateFiled = date;
        this.user = user;
        this.status = status;
        this.name = name;
    }
/* This constructor makes the object out of the expected
*  ResultSetContainer USER_TAX_FORM_HEADER_LIST in the Map
*
*/
    public TaxFormHeader(Map results, int row) {
        ResultSetContainer rsc = (ResultSetContainer) results.get(USER_TAX_FORM_HEADER_LIST);

        if (rsc == null) {
            rsc = (ResultSetContainer) results.get(TAX_FORM_LIST);
            if (rsc == null) {
                log.debug("TFH - There was no " + TAX_FORM_LIST + " or " + USER_TAX_FORM_HEADER_LIST + " result set container");
                status = "Default Status";
                statusId = 0;
                user = new UserProfileHeader();
                id = 0;
                name = "Default Tax Form Name";
                dateFiled = "00/00/00";
                return;
            }


        }

        int rowCount = rsc.getRowCount();

        if (row >= rowCount || row < 0) {
            log.debug("TFH - Bad row: " + row);
            status = "Default Status";
            statusId = 0;
            user = new UserProfileHeader();
            id = 0;
            name = "Default Tax Form Name";
            dateFiled = "00/00/00";
            return;
        }

        ResultSetContainer.ResultSetRow rsr = rsc.getRow(row);

        id = TCData.getTCLong(rsr, "tax_form_id", 0, true);
        status = TCData.getTCString(rsr, "status_desc", "default status", true);
        statusId = TCData.getTCInt(rsr, "status_id", 0, true);
        name = TCData.getTCString(rsr, "name", "default tax form", true);
        dateFiled = TCData.getTCDate(rsr, "date_filed", "00/00/00", false);
        user = new UserProfileHeader(
                TCData.getTCLong(rsr, "user_id", 0, false),
                TCData.getTCString(rsr, "handle", "default handle", false));

    }

/* This constructor does the same as above, only assumes that the row is 0
*
*/
    TaxFormHeader(Map results) {
        this(results, 0);
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateFiled() {
        return dateFiled;
    }

    public void setDateFiled(String dateFiled) {
        this.dateFiled = dateFiled;
    }


}
