package com.topcoder.common.web.data;

import java.util.*;
import java.io.Serializable;
import com.topcoder.common.web.util.*;
import com.topcoder.common.web.constant.*;
import com.topcoder.shared.docGen.xml.*;


public class JobAd implements Comparable, Serializable, Base {
  
  private int JobPostingId;
  private String CompanyName;
  private String Title;
  private String StateCode;
  private String JobTypeDesc;
  private java.sql.Timestamp AdStart;
  private SortKey Sort;


  public JobAd() {
    JobPostingId = 0;
    CompanyName = "";
    Title = "";
    StateCode = "";
    JobTypeDesc = "";
    AdStart = null;
    Sort = new SortKey ( 
      com.topcoder.common.web.constant.Sort.DEFAULT_JOB_AD_SORT_KEY
      ,com.topcoder.common.web.constant.Sort.DEFAULT_JOB_AD_SORT_DIR 
    );
  }


  public static final int AD_START      = 0; 
  public static final int COMPANY_NAME  = 1;
  public static final int TITLE         = 2; 
  public static final int STATE_CODE    = 3;
  public static final int JOB_TYPE_DESC = 4; 


  public int compareTo ( Object other ) {
    int result = 0;
    try {
      if ( Sort != null ) {
        JobAd otherJobAd = (JobAd) other;
        Comparable thisComparator            = null;
        Comparable otherComparator           = null;
        switch ( Sort.getKey() ) {
          case AD_START:
            thisComparator  = this.getAdStart();
            otherComparator = otherJobAd.getAdStart();
            if ( thisComparator == null  ) thisComparator  = new java.sql.Timestamp(0);
            if ( otherComparator == null ) otherComparator = new java.sql.Timestamp(0);
            break;
          case COMPANY_NAME:
            if ( this.getCompanyName() != null ) thisComparator  = this.getCompanyName().toUpperCase();
            if ( otherJobAd.getCompanyName() != null ) otherComparator = otherJobAd.getCompanyName().toUpperCase();
            break;
          case TITLE:
            thisComparator  = this.getTitle().toUpperCase();
            otherComparator = otherJobAd.getTitle().toUpperCase();
            break;
          case STATE_CODE:
            thisComparator  = this.getStateCode();
            otherComparator = otherJobAd.getStateCode();
            break;
          case JOB_TYPE_DESC:
            thisComparator  = this.getJobTypeDesc().toUpperCase();
            otherComparator = otherJobAd.getJobTypeDesc().toUpperCase();
            break;
        }
        if ( thisComparator!=null && otherComparator!=null ) {
          if ( Sort.getDir() == 'A' ) {
            result = thisComparator.compareTo ( otherComparator );
          } else {
            result = otherComparator.compareTo ( thisComparator );
          }
        }
      }
    } catch ( Exception e ) {
      e.printStackTrace();
    }
    return result;
  }


  //Set
  public void setJobPostingId(int JobPostingId) {
    this.JobPostingId = JobPostingId;
  }

  public void setCompanyName(String CompanyName) {
    this.CompanyName = CompanyName;
  }

  public void setJobTypeDesc (String JobTypeDesc) {
    this.JobTypeDesc = JobTypeDesc;
  }

  public void setTitle (String Title) {
    this.Title = Title;
  }

  public void setStateCode(String StateCode) {
    this.StateCode = StateCode;
  }

  public void setAdStart (java.sql.Timestamp AdStart) {
    this.AdStart = AdStart;
  }

  public void setSort(SortKey Sort) {
    this.Sort = Sort;
  }


  // Get
  public int getJobPostingId() {
    return JobPostingId;
  }

  public String getCompanyName() {
    return CompanyName;
  }

  public String getJobTypeDesc() {
    return JobTypeDesc;
  }

  public String getTitle() {
    return Title;
  }

  public String getStateCode() {
    return StateCode;
  }

  public java.sql.Timestamp getAdStart() {
    return AdStart;
  }

  public SortKey getSort() {
    return Sort;
  }


  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag ( "JobAd"                           );
      result.addTag ( new ValueTag("JobPostingId", JobPostingId) );
      result.addTag ( new ValueTag("CompanyName", CompanyName)   );
      result.addTag ( new ValueTag("JobTypeDesc", JobTypeDesc)   );
      result.addTag ( new ValueTag("Title", Title)               );
      result.addTag ( new ValueTag("StateCode", StateCode)       );
      if (AdStart != null) {
        result.addTag ( new ValueTag("AdStart", AdStart)         );
      }
      if (Sort != null) {
        result.addTag ( Sort.getXML()                            );
      }
    } catch ( Exception e )  {
      throw new Exception ( "common.web.data.JobAd getXML ERROR:"+e );
    }
    return result;
  }


}
