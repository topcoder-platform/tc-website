package com.topcoder.common.web.data.admin;

import java.io.Serializable;
import java.util.*;
import java.sql.Date;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.xml.*;

public final class Round implements Serializable, Base {

  private int roundId;
  private String roundName;
  private String contestName;
  
  public Round () {
    this.roundId = 0;
    this.roundName = "";
    this.contestName = "";
  }

// set
           
  public void setRoundId(int roundId) {
    this.roundId = roundId;
  }
  
  public void setRoundName(String roundName) {
    this.roundName = roundName;
  }

  public void setContestName(String contestName) {
    this.contestName = contestName;
  }
// get

  public int getRoundId() {
    return this.roundId;
  }
 
  public String getRoundName() {
    return this.roundName;
  }

  public String getContestName() {
    return this.contestName;
  }

  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("Round");
      result.addTag( new ValueTag("RoundId", roundId) );
      result.addTag( new ValueTag("RoundName", roundName) );
      result.addTag( new ValueTag("ContestName", contestName) );

    }catch (Exception e)  {
      throw new Exception("com.topcoder.common.web.data.admin.Round getXML ERROR: " + e);
    }
    return result;
  }
  
}

