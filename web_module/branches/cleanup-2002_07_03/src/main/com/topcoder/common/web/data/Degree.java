package com.topcoder.common.web.data;

import java.io.Serializable;
import com.topcoder.shared.docGen.xml.*;


public final class Degree 
  implements Serializable, Cloneable, Base {

  private int DegreeId;
  private String DegreeDesc;

  public Degree() {
    DegreeId = 0;
    DegreeDesc = "";
  }

  public Object clone()
    throws CloneNotSupportedException, OutOfMemoryError {
    Degree result = null;
    try {
      result = new Degree();
      result.setDegreeId( getDegreeId() );
      result.setDegreeDesc( getDegreeDesc() );
    } catch (Exception e) {
      e.printStackTrace();
    }
    return result;
  }


// set
  public void setDegreeId(int DegreeId) {
    this.DegreeId = DegreeId;
  }

  public void setDegreeDesc(String DegreeDesc) {
    if (DegreeDesc!=null) this.DegreeDesc = DegreeDesc;
  }


// get
  public int getDegreeId() {
    return DegreeId;
  }

  public String getDegreeDesc() {
    return DegreeDesc;
  }

  
  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("Degree");
      result.addTag( new ValueTag("DegreeId", DegreeId) );
      result.addTag( new ValueTag("DegreeDesc", DegreeDesc) );
    }catch (Exception e)  {
      throw new Exception("common.web.data.Degree getXML ERROR: " + e);
    }
    return result;
  }
  
}

