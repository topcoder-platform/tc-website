package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.text.DateFormat;

public class SearchResult implements Serializable, TagRenderer {

    private int coderId;
    private String handle;
    private String state;
    private int rating;
    private int numRatings;
    private java.sql.Date lastCompDate;


    public SearchResult() {
        coderId = 0;
        handle = "";
        state = "";
        rating = 0;
        numRatings = 0;
        lastCompDate = null;
    }


    public void setCoderId(int coderId) {
        this.coderId = coderId;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setNumRatings(int numRatings) {
        this.numRatings = numRatings;
    }

    public void setLastCompDate(java.sql.Date lastCompDate) {
        this.lastCompDate = lastCompDate;
    }


    // Get
    public int getCoderId() {
        return coderId;
    }

    public String getHandle() {
        return handle;
    }

    public String getState() {
        return state;
    }

    public int getRating() {
        return rating;
    }

    public int getNumRatings() {
        return numRatings;
    }

    public java.sql.Date getLastCompDate() {
        return lastCompDate;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("SearchResult");
            result.addTag(new ValueTag("CoderId", coderId));
            result.addTag(new ValueTag("Handle", handle));
            result.addTag(new ValueTag("State", state));
            result.addTag(new ValueTag("Rating", rating));
            result.addTag(new ValueTag("NumRatings", numRatings));
            if (lastCompDate == null)
                result.addTag(new ValueTag("LastCompDate", ""));
            else
                result.addTag(new ValueTag("LastCompDate", DateFormat.getDateInstance(DateFormat.LONG).format(lastCompDate)));
        } catch (Exception e) {
            throw new Exception("common.web.data.SearchResult getXML ERROR: " + e);
        }
        return result;
    }

}

