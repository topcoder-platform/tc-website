package com.topcoder.web.tc.controller.legacy.pacts.common;

/**
 * This class holds the data fields of an affidavit which must be known
 * when adding a new affidavit to the database.
 *
 * @author   Dave Pecora
 * @version  1.00, 03/21/2002
 */
public class AffidavitAddition implements java.io.Serializable {
    public long round_id;
    public long user_id;
    public int status_id;
    public String affidavit_desc;
    public int affidavit_type_id;
    public String text;

    /**
     * This constructor builds an AffidavitAddition from the specified data.
     * A new affidavit database entry constructed using the data fields from this
     * class will be marked as not notarized and not affirmed.  The creation date
     * will be set to the current date/time.
     *
     * @param roundId The round ID of the affidavit (if applicable).
     * @param userId The user ID this affidavit will be associated with
     * @param statusId The status code for this affidavit
     * @param description The description of the affidavit
     * @param typeId The type code of the affidavit
     * @param text The affidavit text
     */
    public AffidavitAddition(long roundId, long userId, int statusId, String description,
                             int typeId, String text) {
        this.round_id = roundId;
        this.user_id = userId;
        this.status_id = statusId;
        this.affidavit_desc = description;
        this.affidavit_type_id = typeId;
        this.text = text;
    }
}

