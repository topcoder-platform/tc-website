package com.topcoder.common.web.data;


import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;


public class Link
        implements
        Serializable
        , TagRenderer
        //,Comparable
        //,Cloneable
        //,Modifiable
{

    private int linkId;
    private int screenId;
    private String linkDesc;
    private String status;
    private String modified;

    public Link() {
        linkDesc = "";
        modified = "";
        status = "";
        linkId = 0;
        screenId = 0;
    }

/*
  public boolean equals ( Object other ) {
    boolean result = false;
    Link otherLink = (Link) other;
    if (
      getLinkDesc().equals ( otherLink.getLinkDesc() )
      && getCity().equals ( otherLink.getCity() )
      && getState().getStateCode().equals ( otherLink.getState().getStateCode() )
      && getCountry().getCountryCode().equals ( otherLink.getCountry().getCountryCode() )
      && getLinkId() == otherLink.getLinkId()
      && getLinkId() == otherLink.getLinkId()
      && getSortLetter().equals ( otherLink.getSortLetter() )
    ) {
      result = true;
    }
    return result;
  }
*/


/*
  public Object clone()
    throws CloneNotSupportedException, OutOfMemoryError {
    Link result = null;
    try {
      result = new Link();
      result.setLinkId( getLinkId() );
      result.setLinkId( getLinkId() );
      result.setLinkDesc( getLinkDesc() );
      result.setSortLetter( getSortLetter() );
      result.setCity( getCity() );
      result.setState( (State)getState().clone() );
      result.setCountry( (Country)getCountry().clone() );
      result.setModified( getModified() );
    } catch (Exception e) {
      e.printStackTrace();
    }
    return result;
  }
*/

/*
  public int compareTo(Object other) {
    Link otherLink = (Link) other;
    StringBuffer temp = new StringBuffer(132);
    char[] beginLinkDesc = new char[4];
    temp.append(this.getSortLetter());
    temp.append(this.getLinkDesc());
    if (temp.length() > 5) {
      temp.getChars(1,5,beginLinkDesc,0);
      if (beginLinkDesc[0]=='T' && beginLinkDesc[1]=='h' && beginLinkDesc[2]=='e' && beginLinkDesc[3]==' ') {
        temp.delete(1,5);
      }
    }
    String thisComparator = temp.toString();
    temp.delete(0, temp.length());
    temp.append(otherLink.getSortLetter());
    temp.append(otherLink.getLinkDesc());
    if (temp.length() > 5) {
      temp.getChars(1,5,beginLinkDesc,0);
      if (beginLinkDesc[0]=='T' && beginLinkDesc[1]=='h' && beginLinkDesc[2]=='e' && beginLinkDesc[3]==' ') {
        temp.delete(1,5);
      }
    }
    String otherComparator = temp.toString();
    return thisComparator.compareToIgnoreCase( otherComparator );
  }
*/

/*
  public void setAllModifiedStable() throws Exception {
    setModified("S");
  }
*/


// set

    public void setLinkDesc(String linkDesc) {
        this.linkDesc = linkDesc;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setLinkId(int linkId) {
        this.linkId = linkId;
    }

    public void setScreenId(int screenId) {
        this.screenId = screenId;
    }

// get

    public String getLinkDesc() {
        return linkDesc;
    }

    public String getStatus() {
        return status;
    }

    public String getModified() {
        return modified;
    }

    public int getLinkId() {
        return linkId;
    }

    public int getScreenId() {
        return screenId;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Link");
            result.addTag(new ValueTag("LinkId", linkId));
            result.addTag(new ValueTag("ScreenId", screenId));
            result.addTag(new ValueTag("LinkDesc", linkDesc));
            result.addTag(new ValueTag("Status", status));
            result.addTag(new ValueTag("Modified", modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.Link getXML ERROR: " + e);
        }
        return result;
    }

}
