/******************************************************************************\
 *
 * File:          NoteHeader.java
 * Creation date: March 05, 2002 10:19
 * Author:        Matt Murphy
 * Purpose:       Store the more commonly requested information for a note
 * See:           ResultSetContainer.java
 *
 * Modifications: @INSERT_MODIFICATIONS(* )
 * March 05, 2002 10:19 Matt Murphy
 *     Added member '_id'
 *     Added member '_submittedBy'
 *     Added member '_noteType'
 *     Added member '_date'
 *
 * DBP 3/26 - Implement serializable, replace String _submittedBy with UserProfileHeader _user,
 * add _typeId, rename _date to _creationDate
 *
 * Copyright 2002, TopCoder, Inc
 * All rights are reserved. Reproduction in whole or part is prohibited
 * without the written consent of the copyright owner.
 *
 \******************************************************************************/

package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.Map;

public class NoteHeader implements PactsConstants, java.io.Serializable {

/*  Explanation of Members
*
*  _id          - DB id of the note
*  _date        - date the note was submitted
*  _type        - type or subject of the note
*  _submittedBy - handle of the user who submitted the note
*/
    public long _id;
    public long _userId;
    public String _creationDate;
    public String _type;
    public int _typeId;
    public UserProfileHeader _user;

    /**************\
     *              *
     * Constructors *
     *              *
     \**************/

/* Basic constructor that sets all the default values and such
*
*  @ARGS none
*/
    public NoteHeader() {
        setDefaults();
    }

    public void setDefaults() {
        _id = 0;
        _userId = 0;
        _creationDate = "00/00/00";
        _type = "Default Note Type";
        _typeId = 0;
        _user = new UserProfileHeader();
    }
/* This constructor makes the object out of raw data.
*
*  @ARGS
*   o id     - DB id of the note
*   o date   - date the note was submitted
*   o type   - type description of the note
*   o typeId - type ID of the note
*   o userId - ID of the user who submitted the note
*   o handle - name of the user who submitted the note
*
*/
    public NoteHeader(long id, String date, String type, int typeId, long userId, String handle) {

        _id = id;
        _creationDate = date;
        _type = type;
        _typeId = typeId;
        _user = new UserProfileHeader(userId, handle);

    }

    public NoteHeader(Map results, int row) {
        ResultSetContainer rsc = (ResultSetContainer) results.get(NOTE_HEADER_LIST);
        // check if it was there
        if (rsc == null) {
            setDefaults();
            return;
        }
        int rowCount = rsc.getRowCount();
        // make sure the row is valid
        if ((rowCount < 1) || (rowCount <= row)) {
            setDefaults();
            return;
        }
        ResultSetContainer.ResultSetRow rsr = rsc.getRow(row);
        _id = TCData.getTCLong(rsr, "note_id", 0, true);
        _creationDate = TCData.getTCDate(rsr, "date_created", "00/00/00", true);
        _type = TCData.getTCString(rsr, "note_type_desc", "default note type", true);
        _typeId = TCData.getTCInt(rsr, "note_type_id", 0, true);
        _user = new UserProfileHeader();
        _user._handle = TCData.getTCString(rsr, "handle", "submitting staff member", true);
        _user._id = TCData.getTCLong(rsr, "submitted_by", 0, false);
        _userId = TCData.getTCLong(rsr, "user_id");
    }

    public NoteHeader(Map results) {
        this(results, 0);
    }
}
