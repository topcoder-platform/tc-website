package com.topcoder.common.web.data;


import java.io.Serializable;
import com.topcoder.common.web.xml.*;


public final class Notify 
  implements Serializable, Base {

  private int notifyId;
  private String name;
  private int sort;


  public Notify() {
    notifyId = 0;
    name = null;
    sort = 0;
  }


// set
  public void setNotifyId ( int notifyId ) {
    this.notifyId = notifyId;
  }

  public void setName ( String name ) {
    if ( name != null ) this.name = name;
  }

  public void setSort ( int sort ) {
    this.sort = sort;
  }



// get
  public int getNotifyId() {
    return notifyId;
  }

  public String getName() {
    if ( name == null ) name = "";
    return name;
  }

  public int getSort() {
    return sort;
  }

  
  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag ( "Notify" );
      result.addTag( new ValueTag("NotifyId",notifyId) );
      result.addTag( new ValueTag("Name",name) );
      result.addTag( new ValueTag("Sort",sort) );
    } catch ( Exception e )  {
      e.printStackTrace();
    }
    return result;
  }
  
}

