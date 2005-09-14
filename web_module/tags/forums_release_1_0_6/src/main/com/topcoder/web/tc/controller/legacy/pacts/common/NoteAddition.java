package com.topcoder.web.tc.controller.legacy.pacts.common;

/**
 * This class holds the data fields of a note which must be known
 * when adding a new note to the database.
 *
 * @author   Dave Pecora
 * @version  1.00, 03/21/2002
 */
public class NoteAddition implements java.io.Serializable {
    String text;
    int note_type_id;
    long submitted_by;

    /**
     * This constructor builds a NoteAddition from the specified data.
     * When constructing a new note from the data here, the timestamp
     * column is set to the current date/time, while the date_modified
     * column is left null.
     *
     * @param text The note text
     * @param typeId The type of the note
     * @param submittingUserId The user ID submitting the note
     */
    public NoteAddition(String text, int typeId, long submittingUserId) {
        this.text = text;
        this.note_type_id = typeId;
        this.submitted_by = submittingUserId;
    }
}

