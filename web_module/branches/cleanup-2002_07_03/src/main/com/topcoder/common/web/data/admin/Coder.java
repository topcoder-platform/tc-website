package com.topcoder.common.web.data.admin;

import java.io.Serializable;
import java.util.*;
import java.sql.Date;
import com.topcoder.common.web.data.*;
import com.topcoder.shared.docGen.xml.*;

public final class Coder implements Serializable, Base{

  private int coderId;
  private String handle;
  
  public Coder () {
    this.coderId = 0;
    this.handle = "";
  }

// set
           
  public void setCoderId(int coderId) {
    this.coderId = coderId;
  }
  
  public void setHandle(String handle) {
    this.handle = handle;
  }

// get

  public int getCoderId() {
    return this.coderId;
  }
 
  public String getHandle() {
    return this.handle;
  }

  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("Coder");
      result.addTag( new ValueTag("CoderId", coderId) );
      result.addTag( new ValueTag("Handle", handle) );

    }catch (Exception e)  {
      throw new Exception("com.topcoder.common.web.data.admin.Coder getXML ERROR: " + e);
    }
    return result;
  }
  
}

