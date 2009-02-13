package com.topcoder.common.web.data;


import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;


public class Menu
        implements
        Serializable
        , TagRenderer
        //,Comparable
        //,Cloneable
        //,Modifiable
{

    private int menuId;
    private Link link;
    private String menuDesc;
    private String status;
    private String modified;

    public Menu() {
        menuDesc = "";
        modified = "";
        status = "";
        menuId = 0;
        link = new Link();
    }

/*
  public boolean equals ( Object other ) {
    boolean result = false;
    Menu otherMenu = (Menu) other;
    if (
      getMenuDesc().equals ( otherMenu.getMenuDesc() )
      && getCity().equals ( otherMenu.getCity() )
      && getState().getStateCode().equals ( otherMenu.getState().getStateCode() )
      && getCountry().getCountryCode().equals ( otherMenu.getCountry().getCountryCode() )
      && getMenuId() == otherMenu.getMenuId()
      && getMenuId() == otherMenu.getMenuId()
      && getSortLetter().equals ( otherMenu.getSortLetter() )
    ) {
      result = true;
    }
    return result;
  }
*/


/*
  public Object clone()
    throws CloneNotSupportedException, OutOfMemoryError {
    Menu result = null;
    try {
      result = new Menu();
      result.setMenuId( getMenuId() );
      result.setMenuId( getMenuId() );
      result.setMenuDesc( getMenuDesc() );
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
    Menu otherMenu = (Menu) other;
    StringBuffer temp = new StringBuffer(132);
    char[] beginMenuDesc = new char[4];
    temp.append(this.getSortLetter());
    temp.append(this.getMenuDesc());
    if (temp.length() > 5) {
      temp.getChars(1,5,beginMenuDesc,0);
      if (beginMenuDesc[0]=='T' && beginMenuDesc[1]=='h' && beginMenuDesc[2]=='e' && beginMenuDesc[3]==' ') {
        temp.delete(1,5);
      }
    }
    String thisComparator = temp.toString();
    temp.delete(0, temp.length());
    temp.append(otherMenu.getSortLetter());
    temp.append(otherMenu.getMenuDesc());
    if (temp.length() > 5) {
      temp.getChars(1,5,beginMenuDesc,0);
      if (beginMenuDesc[0]=='T' && beginMenuDesc[1]=='h' && beginMenuDesc[2]=='e' && beginMenuDesc[3]==' ') {
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

    public void setMenuDesc(String menuDesc) {
        this.menuDesc = menuDesc;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public void setLink(Link link) {
        this.link = link;
    }

// get

    public String getMenuDesc() {
        return menuDesc;
    }

    public String getStatus() {
        return status;
    }

    public String getModified() {
        return modified;
    }

    public int getMenuId() {
        return menuId;
    }

    public Link getLink() {
        return link;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Menu");
            result.addTag(new ValueTag("MenuId", menuId));
            result.addTag(link.getXML());
            result.addTag(new ValueTag("MenuDesc", menuDesc));
            result.addTag(new ValueTag("Status", status));
            result.addTag(new ValueTag("Modified", modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.Menu getXML ERROR: " + e);
        }
        return result;
    }

}
