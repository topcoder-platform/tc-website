package com.topcoder.common.web.data;

import java.util.ArrayList;
import java.io.Serializable;
import com.topcoder.common.web.constant.*;
import com.topcoder.common.web.xml.*;

public class SchoolSelections 
  implements Serializable, Base {

  private boolean MaximumExceeded;
  private ArrayList SessionSchools;

  public SchoolSelections() {
    MaximumExceeded = false;
    SessionSchools = new ArrayList(TCServlet.MAX_SCHOOLS);
  }

  //Set
  public void setMaximumExceeded(boolean MaximumExceeded) {
    this.MaximumExceeded = MaximumExceeded;
  }

  public void setSessionSchools(ArrayList SessionSchools) {
    this.SessionSchools = SessionSchools;
  }

  // Get
  public boolean getMaximumExceeded() {
    return MaximumExceeded;
  }

  public ArrayList getSessionSchools() {
    return SessionSchools;
  }

  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("SchoolSelections");
      result.addTag( new ValueTag("MaximumExceeded", MaximumExceeded) );
      for (int i=0; i < SessionSchools.size(); i++) {
        School school = (School) SessionSchools.get(i);
        result.addTag( school.getXML() );
      }
    } catch (Exception e)  {
      throw new Exception("common.web.data.SchoolSelections:getXML:ERROR:\n"+e);
    }
    return result;
  }
}
