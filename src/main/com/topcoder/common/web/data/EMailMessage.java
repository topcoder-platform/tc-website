package com.topcoder.common.web.data;

import java.io.Serializable;
import java.sql.Date;
import com.topcoder.common.web.xml.*;


public final class EMailMessage implements Serializable, Base {
  private int MailId;
  private String MailSubject;
  private java.sql.Date MailSentDate;
  private String MailText;
  private String MailToAddress;
  private String MailFromAddress;
  private String MailFromPersonal;
  private int CoderId ;
  private String Reason;
  private String Mode;

  public EMailMessage() {
    MailId = 0;
    MailSubject = "";
    MailSentDate =  null;
    MailText = "";
    MailToAddress = "";
    MailFromAddress = "";
    MailFromPersonal = "";
    CoderId = 0;
    Reason = "";
    Mode = "";
  }

// set
  public void setMailId(int MailId) {
    this.MailId = MailId;
  }

  public void setMailSubject(String MailSubject) {
    this.MailSubject = MailSubject;
  }

  public void setMailSentDate(java.sql.Date MailSentDate) {
    this.MailSentDate = MailSentDate;
  }

  public void setMailText(String MailText) {
    this.MailText = MailText;
  }

  public void setMailToAddress(String MailToAddress) {
    this.MailToAddress = MailToAddress;
  }

  public void setMailFromAddress(String MailFromAddress) {
    this.MailFromAddress = MailFromAddress;
  }

  public void setMailFromPersonal(String MailFromPersonal) {
    this.MailFromPersonal = MailFromPersonal;
  }

  public void setCoderId(int CoderId) {
    this.CoderId = CoderId;
  }

  public void setReason(String Reason) {
    this.Reason = Reason;
  }

  public void setMode(String Mode) {
    this.Mode = Mode;
  }

// get
  public int getMailId() {
    return MailId;
  }

  public String getMailSubject() {
    return MailSubject;
  }

  public java.sql.Date getMailSentDate() {
    return MailSentDate;
  }

  public String getMailText() {
    return MailText;
  }

  public String getMailToAddress() {
    return MailToAddress;
  }
  
  public String getMailFromAddress() {
    return MailFromAddress;
  }
  
  public String getMailFromPersonal() {
    return MailFromPersonal;
  }
  
  public int getCoderId() {
    return CoderId;
  }

  public String getMode() {
    return Mode;
  }

  public String getReason() {
    return Reason;
  }

  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("EMailMessage");
      result.addTag( new ValueTag("MailId", MailId) );
      result.addTag( new ValueTag("MailSubject", MailSubject) );
      result.addTag( new ValueTag("MailText", MailText) );
      result.addTag( new ValueTag("MailSentDate", MailSentDate.toString()));
      result.addTag( new ValueTag("MailToAddress", MailToAddress) );
      result.addTag( new ValueTag("MailFromAddress", MailFromAddress) );
      result.addTag( new ValueTag("MailFromPersonal", MailFromPersonal) );
      result.addTag( new ValueTag("CoderId", CoderId) );
      result.addTag( new ValueTag("Reason", Reason) );
      result.addTag( new ValueTag("Mode", Mode) );
    } catch (Exception e)  {
      throw new Exception("common.web.data.EMailMessage getXML ERROR: " + e);
    }
    return result;
  }
}

