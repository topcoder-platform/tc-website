package com.topcoder.common.web.data;

import java.io.Serializable;
import com.topcoder.shared.docGen.xml.*;


public class Job implements Serializable, Base {

  private int JobId;
  private String JobDesc;

  public Job() {
    JobId = 0;
    JobDesc = "";
  }

  //Set
  public void setJobId(int JobId) {
    this.JobId = JobId;
  }

  public void setJobDesc(String JobDesc) {
    this.JobDesc = JobDesc;
  }

  // Get
  public int getJobId() {
    return JobId;
  }

  public String getJobDesc() {
    return JobDesc;
  }

  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("Job");
      result.addTag( new ValueTag("JobId", JobId) );
      result.addTag( new ValueTag("JobDesc", JobDesc) );
    } catch (Exception e)  {
      throw new Exception("common.web.data.Job:getXML:ERROR:\n"+e);
    }
    return result;
  }
}
