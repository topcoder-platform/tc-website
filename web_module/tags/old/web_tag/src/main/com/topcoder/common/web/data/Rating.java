package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;
import com.topcoder.shared.util.logging.Logger;

import java.io.Serializable;

public final class Rating implements Serializable, TagRenderer {

    private int CoderId;
    private int ContestId;
    private int RoundId;
    private int Rating;
    private java.sql.Date LastRatedEvent;
    private int NumRatings;
    private String Modified;
    private static Logger log = Logger.getLogger(Rating.class);

    public Rating() {
        CoderId = 0;
        ContestId = 0;
        RoundId = 0;
        Rating = 0;
        LastRatedEvent = null;
        NumRatings = 0;
        Modified = "";
    }

/*
  public Object clone()
    throws CloneNotSupportedException, OutOfMemoryError {
    Rating result = null;
    try {
      result = new Rating();
      result.setCoderId( getCoderId() );
      result.setContestId( getContestId() );
      result.setRoundId( getRoundId() );
      result.setRating( getRating() );
      result.setLastRatedEvent( getLastRatedEvent() );
      result.setNumRatings( getNumRatings() );
      result.setModified( getModified() );
    } catch (Exception e) {
      Log.msg("common.web.data.Rating:clone:ERROR:\n"+e);
    }
    return result;
  }
*/


//submit
    public void toggleModified() {
        if (getModified().equals("S")) setModified("U");
        if (getModified().equals("")) setModified("A");
    }


// set
    public void setCoderId(int CoderId) {
        this.CoderId = CoderId;
    }

    public void setContestId(int ContestId) {
        this.ContestId = ContestId;
    }

    public void setRoundId(int RoundId) {
        this.RoundId = RoundId;
    }

    public void setRating(int Rating) {
        this.Rating = Rating;
    }

    public void setLastRatedEvent(java.sql.Date LastRatedEvent) {
        this.LastRatedEvent = LastRatedEvent;
    }

    public void setNumRatings(int NumRatings) {
        this.NumRatings = NumRatings;
    }

    public void setModified(String modified) {
        this.Modified = modified;
    }


// get
    public int getCoderId() {
        return CoderId;
    }

    public int getContestId() {
        return ContestId;
    }

    public int getRoundId() {
        return RoundId;
    }

    public int getRating() {
        return Rating;
    }

    public java.sql.Date getLastRatedEvent() {
        return LastRatedEvent;
    }

    public int getNumRatings() {
        return this.NumRatings;
    }

    public String getModified() {
        return Modified;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Rating");
            result.addTag(new ValueTag("CoderId", CoderId));
            result.addTag(new ValueTag("ContestId", ContestId));
            result.addTag(new ValueTag("RoundId", RoundId));
            result.addTag(new ValueTag("Rating", Rating));
            result.addTag(new ValueTag("LastRatedEvent", LastRatedEvent));
            result.addTag(new ValueTag("NumRatings", NumRatings));
            result.addTag(new ValueTag("Modified", Modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.Rating getXML ERROR: " + e);
        }
        return result;
    }

}

