package com.topcoder.common.web.data;

import java.util.ArrayList;
import java.io.Serializable;
import com.topcoder.shared.docGen.xml.*;


public class JobPreference implements Serializable, TagRenderer, Cloneable {

  private int coderId;
  private Job job;
  private String modified;

  public JobPreference() {
    coderId = 0;
    job = new Job();
    modified = "";
  }

  public Object clone()
    throws CloneNotSupportedException, OutOfMemoryError {
    JobPreference result = null;
    try {
      result = new JobPreference();
      result.setCoderId( getCoderId() );
      result.setJobType( getJob() );
      result.setModified( getModified() );
    } catch (Exception e) {
      e.printStackTrace();
    }
    return result;
  }


  //Submit
  //////////////////////////////////////////////////////////////////////////
  public void toggleModified() {
  //////////////////////////////////////////////////////////////////////////
    if ( getModified().equals("S") ) setModified("U");
    else if ( getModified().equals("") ) setModified("A");
  }

  //Set
  public void setCoderId(int coderId) {
    this.coderId = coderId;
  }

  public void setJobType(Job job) {
    this.job = job;
  }

  public void setModified(String modified) {
    this.modified = modified;
  }

  // Get
  public int getCoderId() {
    return coderId;
  }

  public Job getJob() {
    return job;
  }

  public String getModified() {
    return modified;
  }

  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("JobPreference");
      result.addTag( new ValueTag("CoderId", coderId) );
      result.addTag( job.getXML() );
      result.addTag( new ValueTag("Modified", modified) );
    } catch ( Exception e )  {
      throw new Exception (
        "common.web.data.JobPreference:getXML:ERROR:\n"+e
      );
    }
    return result;
  }

}
