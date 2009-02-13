package com.topcoder.common.web.data;

import java.io.Serializable;
import com.topcoder.common.web.xml.*;
import com.topcoder.common.web.error.*;
import java.util.*;


public final class Room implements Serializable, Base {
	
  private int contestId;
  private int roundId;
  private int roomId;
  private ArrayList coders;  // ArrayList of ContestCoders
  private String roomDesc;
  private String modified;
  
  public Room () {
    this.contestId = 0;
    this.roundId = 0;
    this.roomId = 0;
    this.coders = new ArrayList();
    this.roomDesc = "";
    this.modified = "";
  }


  public Room (int contestId, int roundId) {
    this.contestId = contestId;
    this.roundId = roundId;
    this.roomId = 0;
    this.coders = new ArrayList();
    this.roomDesc = "";
    this.modified = "";
  }

// set
           
  public void setContestId(int contestId) {
    this.contestId = contestId;
  }
  
  public void setRoundId(int roundId) {
    this.roundId = roundId;
  }
  
  public void setRoomId(int roomId) {
    this.roomId = roomId;
  }
  
  public void setCoders(ArrayList coders) {
    this.coders = coders;
  }
  
  public void setRoomDesc(String roomDesc) {
    this.roomDesc = roomDesc;
  }
  
  public void setModified(String modified) {
    this.modified = modified;
  }

// get

  public int getContestId() {
    return this.contestId;
  }

  public int getRoundId() {
    return this.roundId;
  }
  
  public int getRoomId() {
    return this.roomId;
  }
 
  public ArrayList getCoders() {
    return this.coders;
  }
  
  public String getRoomDesc() {
    return this.roomDesc;
  }
  
  public String getModified() {
    return this.modified;
  }

  public RecordTag getXML() throws TCException {
    RecordTag result = null;
    try {
      result = new RecordTag("Contest");
      result.addTag( new ValueTag("ContestId", contestId) );
      result.addTag( new ValueTag("RoundId", roundId) );
      result.addTag( new ValueTag("RoomId", roomId) );
      result.addTag( new ValueTag("RoomDesc", roomDesc) );
      result.addTag( new ValueTag("Modified", modified) );
    }catch (Exception e)  {
      throw new TCException("common.Room getXML ERROR: " + e);
    }
    return result;
  }
  
}
