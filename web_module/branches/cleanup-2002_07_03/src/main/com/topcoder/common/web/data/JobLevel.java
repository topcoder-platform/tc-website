package com.topcoder.common.web.data;

import java.io.Serializable;
import com.topcoder.shared.docGen.xml.*;


public class JobLevel implements Serializable, TagRenderer {

  private int JobLevelId;
  private String JobLevelDesc;

  public JobLevel() {
    JobLevelId = 0;
    JobLevelDesc = "";
  }

  //Set
  public void setJobLevelId(int JobLevelId) {
    this.JobLevelId = JobLevelId;
  }

  public void setJobLevelDesc(String JobLevelDesc) {
    this.JobLevelDesc = JobLevelDesc;
  }

  // Get
  public int getJobLevelId() {
    return JobLevelId;
  }

  public String getJobLevelDesc() {
    return JobLevelDesc;
  }

  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("JobLevel");
      result.addTag( new ValueTag("JobLevelId", JobLevelId) );
      result.addTag( new ValueTag("JobLevelDesc", JobLevelDesc) );
    } catch (Exception e)  {
      throw new Exception("common.JobLevel:getXML:ERROR:\n"+e);
    }
    return result;
  }
}
