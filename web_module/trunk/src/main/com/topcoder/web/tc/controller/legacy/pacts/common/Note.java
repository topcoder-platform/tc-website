/******************************************************************************\
 *
 * File:          Note.java
 * Creation date: March 05, 2002 10:19
 * Author:        Matt Murphy
 * Purpose:       Store information about a given note
 * See:           NoteHeader.java
 *                ResultSetContainer.java
 *
 * Modifications: @INSERT_MODIFICATIONS(* )
 * March 05, 2002 10:19 Matt Murphy
 *     Added member '_header'
 *     Added member '_text'
 *
 * DBP 3/26 - Implement serializable, change constructor to reflect
 * NoteHeader changes
 *
 * Copyright 2002, TopCoder, Inc
 * All rights are reserved. Reproduction in whole or part is prohibited
 * without the written consent of the copyright owner.
 *
 \******************************************************************************/

package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.Map;

public class Note implements PactsConstants, java.io.Serializable {

/*  Explanation of Members
*
*  _header - more commonly requested information for this note
*  _text   - the actual note made
*/
    public NoteHeader _header;
    public String _text;

    /**************\
     *              *
     * Constructors *
     *              *
     \**************/

/* Basic constructor that sets all the default values and such
*
*  @ARGS none
*/
    public Note() {
        _header = new NoteHeader();
        _text = "Default Note";
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
*   o text   - the note text
*/
    public Note(String text, int type, long user, long user_id) {

        _header = new NoteHeader();
        _header._user._id = user;
        _header._typeId = type;
        _header._userId = user_id;
        _text = text;

    }

/* This constructor makes the object out of raw data & headers.
*
*  @ARGS
*   o header - NoteHeader
*   o text   - the actual note
*
*/
    public Note(NoteHeader header, String text) {

        _header = header;
        _text = text;
    }

/* This constructor uses the Result Set NOTE_DETAIL to make the object
*
*
*/
    public Note(Map results) {

        ResultSetContainer rsc = (ResultSetContainer) results.get(NOTE_DETAIL);

        // check if it was there
        if (rsc == null) {
            _header = new NoteHeader();
            _text = "Default Note";
            return;
        }

        // make sure the row is valid
        if (rsc.getRowCount() < 1) {
            _header = new NoteHeader();
            _text = "Default Note";
            return;
        }

        _text = TCData.getTCString(rsc.getRow(0), "text", "default note text", true);
        _header = new NoteHeader(results);
    }
}
