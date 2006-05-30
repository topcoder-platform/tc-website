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
    private NoteHeader header;
    private String text;

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
        header = new NoteHeader();
        text = "Default Note";
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

        header = new NoteHeader();
        header.getUser().setId(user);
        header.setTypeId(type);
        this.text = text;

    }

/* This constructor makes the object out of raw data & headers.
*
*  @ARGS
*   o header - NoteHeader
*   o text   - the actual note
*
*/
    public Note(NoteHeader header, String text) {

        this.header = header;
        this.text = text;
    }

/* This constructor uses the Result Set NOTE_DETAIL to make the object
*
*
*/
    public Note(Map results) {

        ResultSetContainer rsc = (ResultSetContainer) results.get(NOTE_DETAIL);

        // check if it was there
        if (rsc == null) {
            header = new NoteHeader();
            text = "Default Note";
            return;
        }

        // make sure the row is valid
        if (rsc.getRowCount() < 1) {
            header = new NoteHeader();
            text = "Default Note";
            return;
        }

        text = TCData.getTCString(rsc.getRow(0), "text", "default note text", true);
        header = new NoteHeader(results);
    }


    public NoteHeader getHeader() {
        return header;
    }

    public void setHeader(NoteHeader header) {
        this.header = header;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }


}
