package com.topcoder.web.tc.controller.legacy.pacts.common;

/**
 * This class holds the data fields of a note which must be known
 * when adding a new note to the database.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author   Dave Pecora
 * @version  1.00, 03/21/2002
 */
public class NoteAddition implements java.io.Serializable {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;


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

