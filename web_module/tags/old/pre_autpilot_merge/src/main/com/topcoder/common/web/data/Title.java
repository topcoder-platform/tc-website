package com.topcoder.common.web.data;


import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;

public final class Title
        implements
        Serializable
        , Cloneable
        , TagRenderer {

    private int TitleId;
    private String TitleDesc;
    private String Title;

    public Title() {
        TitleId = 0;
        TitleDesc = "";
        Title = "";
    }

/*
  public boolean equals ( Object obj ) {
    boolean result = false;
    Title other = (Title) obj;
    if (
      this.getTitleId() == other.getTitleId()
      && this.getTitleDesc().equals ( other.getTitleDesc() )
      && this.getTitle().equals ( other.getTitle() )
    ) {
      result = true;
    }
    return result;
  }
*/

/*
  public ArrayList getCriteria ( Object obj ) {
    ArrayList result = new ArrayList(2);
    Title other = (Title) obj;
    if ( !this.getTitleId().equals(other.getTitleId()) ) {
      String[] criteria = { "int", "title", "title_id", this.getTitleId() };
      result.add ( criteria );
    }
    if ( !this.getTitleDesc().equals(other.getTitleDesc()) ) {
      String[] criteria = { "String", "title", "title_desc", this.getTitleDesc() };
      result.add ( criteria );
    }
    if ( !this.getTitle().equals(other.getTitle()) ) {
      String[] criteria = { "String", "title", "title", this.getTitle() };
      result.add ( criteria );
    }
    result.trimToSize();
    return result;
  }
*/


    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        Title result = null;
        try {
            result = new Title();
            result.setTitleId(getTitleId());
            result.setTitleDesc(getTitleDesc());
            result.setTitle(getTitle());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    // set methods
    public void setTitleId(int TitleId) {
        this.TitleId = TitleId;
    }

    public void setTitleDesc(String TitleDesc) {
        this.TitleDesc = TitleDesc;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    // get methods
    public int getTitleId() {
        return TitleId;
    }

    public String getTitleDesc() {
        return TitleDesc;
    }

    public String getTitle() {
        return Title;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = getXML("Title");
        } catch (Exception e) {
            throw new Exception("common.Title getXML ERROR: " + e);
        }
        return result;
    }

    public RecordTag getXML(String name) throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag(name);
            result.addTag(new ValueTag("TitleId", TitleId));
            result.addTag(new ValueTag("TitleDesc", TitleDesc));
            result.addTag(new ValueTag("Title", Title));
        } catch (Exception e) {
            throw new Exception("common.web.data.Title getXML ERROR: " + e);
        }
        return result;
    }

}

