package com.topcoder.common.web.data;

import java.util.ArrayList;
import java.io.Serializable;
import com.topcoder.shared.docGen.xml.*;


public class JobPosting
  implements Serializable, Base, Modifiable {

  private int jobPostingId;
  private int subscriberId;
  private String title;
  private int salaryMin;
  private int salaryMax;
  private PayPeriod payPeriod;
  private JobLevel jobLevel;
  private Job job;
  private String description;
  private String city;
  private State state;
  private Country country;
  private String ad;
  private String status;
  private java.sql.Timestamp adStart;
  private java.sql.Timestamp adEnd;
  private String adCompanyName;
  private String adTask;
  private String adCommand;
  private String adFirstName;
  private String adMiddleName;
  private String adLastName;
  private String adAddress1;
  private String adAddress2;
  private String adCity;
  private State adState;
  private Country adCountry;
  private String adZip;
  private String adPhone;
  private String adFax;
  private String adEmail;
  private Contact billingContact;
  private String modified;


  public JobPosting() {
    jobPostingId = 0;
    subscriberId = 0;
    title = "";
    salaryMin = 0;
    salaryMax = 0;
    payPeriod = new PayPeriod();
    jobLevel = new JobLevel();
    job = new Job();
    description = "";
    city = "";
    state = new State();
    country = new Country();
    ad = "";
    adStart = null; 
    adEnd = null; 
    adCompanyName = "";
    adTask = "";
    adCommand = "";
    adFirstName = "";
    adMiddleName = "";
    adLastName = "";
    adAddress1 = "";
    adAddress2 = "";
    adCity = "";
    adState = new State();
    adCountry = new Country();
    adZip = "";
    adPhone = "";
    adFax = "";
    adEmail = "";
    billingContact = new Contact();
    status = "";
    modified = "";
  }


  public void setAllModifiedStable() throws Exception {
    setModified("S");
  }

  //Set
  public void setJobPostingId(int jobPostingId) {
    this.jobPostingId = jobPostingId;
  }

  public void setSubscriberId(int subscriberId) {
    this.subscriberId = subscriberId;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public void setSalaryMin (int salaryMin) {
    this.salaryMin = salaryMin;
  }

  public void setSalaryMax (int salaryMax) {
    this.salaryMax = salaryMax;
  }

  public void setPayPeriod(PayPeriod payPeriod) {
    this.payPeriod = payPeriod;
  }

  public void setJobLevel(JobLevel jobLevel) {
    this.jobLevel = jobLevel;
  }

  public void setJob(Job job) {
    this.job = job;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public void setState(State state) {
    this.state = state;
  }

  public void setCountry(Country country) {
    this.country = country;
  }

  public void setAd(String ad) {
    this.ad = ad;
  }

  public void setStatus (String status) {
    this.status = status;
  }
 
  public void setAdStart(java.sql.Timestamp adStart) {
    this.adStart = adStart;
  }

  public void setAdEnd(java.sql.Timestamp adEnd) {
    this.adEnd = adEnd;
  }

  public void setAdCompanyName(String adCompanyName) {
    this.adCompanyName = adCompanyName; 
  }

  public void setAdTask(String adTask) {
    this.adTask = adTask; 
  }

  public void setAdCommand(String adCommand) {
    this.adCommand = adCommand;
  }

  public void setAdFirstName(String adFirstName) {
    this.adFirstName = adFirstName;
  } 
  
  public void setAdMiddleName(String adMiddleName) {
    this.adMiddleName = adMiddleName;
  } 

  public void setAdLastName(String adLastName) {
    this.adLastName = adLastName;
  } 
  
  public void setAdAddress1(String adAddress1) {
    this.adAddress1 = adAddress1;
  } 

  public void setAdAddress2(String adAddress2) {
    this.adAddress2 = adAddress2;
  }
  
  public void setAdCity(String adCity) {
    this.adCity = adCity;
  }
  
  public void setAdState(State adState) {
    this.adState = adState;
  }
  
  public void setAdCountry(Country adCountry) {
    this.adCountry = adCountry;
  } 

  public void setAdZip(String adZip) {
    this.adZip = adZip;
  }
  
  public void setAdPhone(String adPhone) {
    this.adPhone = adPhone;
  }

  public void setAdFax(String adFax) {
    this.adFax = adFax;
  }

  public void setAdEmail(String adEmail) {
    this.adEmail = adEmail;
  }

  public void setBillingContact(Contact billingContact) {
    this.billingContact = billingContact;
  }

  public void setModified(String modified) {
    this.modified = modified;
  }


  // Get
  public int getJobPostingId() {
    return jobPostingId;
  }

  public int getSubscriberId() {
    return subscriberId;
  }

  public String getTitle() {
    return title;
  }

  public int getSalaryMin() {
    return salaryMin;
  }

  public int getSalaryMax() {
    return salaryMax;
  }

  public PayPeriod getPayPeriod() {
    return payPeriod;
  }

  public JobLevel getJobLevel() {
    return jobLevel;
  }
  
  public Job getJob() {
    return job;
  }

  public String getDescription() {
    return description;
  }
 
  public String getCity() {
    return city;
  }
  
  public State getState() {
    return state;
  }
  
  public Country getCountry() {
    return country;
  }

  public String getAd() {
    return ad;
  }

  public String getStatus() {
    return status;
  }

  public java.sql.Timestamp getAdStart() {
    return this.adStart;
  }

  public java.sql.Timestamp getAdEnd() {
    return this.adEnd;
  }

  public String getAdCompanyName() {
    return this.adCompanyName;
  }

  public String getAdTask() {
    return this.adTask;
  }

  public String getAdCommand() {
    return this.adCommand;
  }
  
  public String getAdFirstName() {
    return adFirstName;
  }
  
  public String getAdMiddleName() {
    return adMiddleName;
  } 

  public String getAdLastName() {
    return adLastName;
  }

  public String getAdAddress1() {
    return adAddress1;
  } 

  public String getAdAddress2() {
    return adAddress2;
  }

  public String getAdCity() {
    return adCity;
  }

  public State getAdState() {
    return adState;
  }

  public Country getAdCountry() {
    return adCountry;
  }

  public String getAdZip() {
    return adZip;
  }
  
  public String getAdPhone() {
    return adPhone;
  }
  
  public String getAdFax() {
    return adFax;
  }

  public String getAdEmail() {
    return adEmail;
  }

  public Contact getBillingContact() {
    return billingContact;
  }

  public String getModified() {
    return modified;
  }

  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag ( "JobPosting");
      result.addTag(new ValueTag("JobPostingId", jobPostingId));
      result.addTag(new ValueTag("SubscriberId", subscriberId));
      result.addTag(new ValueTag("Title", title));
      result.addTag(new ValueTag("SalaryMin", salaryMin));
      result.addTag(new ValueTag("SalaryMax", salaryMax));
      result.addTag(payPeriod.getXML());
      result.addTag(jobLevel.getXML());
      result.addTag(job.getXML());
      result.addTag(new ValueTag("Description", description));
      result.addTag(new ValueTag("City", city));
      result.addTag(state.getXML());
      result.addTag(country.getXML());
      result.addTag(new ValueTag("Ad", ad));
      result.addTag(new ValueTag("Status", status));
      result.addTag(new ValueTag("AdStart", adStart));
      result.addTag(new ValueTag("AdEnd", adEnd));
      result.addTag(new ValueTag("AdCompanyName", adCompanyName));
      result.addTag(new ValueTag("AdTask", adTask));
      result.addTag(new ValueTag("AdCommand", adCommand));
      result.addTag(new ValueTag("AdFirstName", adFirstName));
      result.addTag(new ValueTag("AdMiddleName", adMiddleName));
      result.addTag(new ValueTag("AdLastName", adLastName));
      result.addTag(new ValueTag("AdAddress1", adAddress1));
      result.addTag(new ValueTag("AdAddress2", adAddress2));
      result.addTag(new ValueTag("AdCity", adCity));
      result.addTag(adState.getXML("AdState"));
      result.addTag(adCountry.getXML("AdCountry"));
      result.addTag(new ValueTag("AdZip", adZip));
      result.addTag(new ValueTag("AdPhone", adPhone));
      result.addTag(new ValueTag("AdFax", adFax));
      result.addTag(new ValueTag("AdEmail", adEmail));
      result.addTag(billingContact.getXML());
      result.addTag(new ValueTag("Modified", modified));
    } catch ( Exception e )  {
      throw new Exception (
        "common.web.data.JobPosting:getXML:ERROR:"+e
      );
    }
    return result;
  }

}




