package com.topcoder.common.web.data;

import java.io.Serializable;
import com.topcoder.shared.docGen.xml.*;


public class JobType implements Serializable, TagRenderer {

  private int jobTypeId;
  private String jobTypeDesc;

  public JobType() {
    jobTypeId = 0;
    jobTypeDesc = "";
  }

  //Set
  public void setJobTypeId(int jobTypeId) {
    this.jobTypeId = jobTypeId;
  }

  public void setJobTypeDesc(String jobTypeDesc) {
    this.jobTypeDesc = jobTypeDesc;
  }

  // Get
  public int getJobTypeId() {
    return jobTypeId;
  }

  public String getJobTypeDesc() {
    return jobTypeDesc;
  }

  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("JobType");
      result.addTag( new ValueTag("JobTypeId", jobTypeId) );
      result.addTag( new ValueTag("JobTypeDesc", jobTypeDesc) );
    } catch (Exception e)  {
      throw new Exception("com.topcoder.common.web.data.JobType:getXML:ERROR:\n"+e);
    }
    return result;
  }
}
