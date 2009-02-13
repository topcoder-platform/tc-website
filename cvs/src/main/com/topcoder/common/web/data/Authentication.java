package com.topcoder.common.web.data;

import java.io.Serializable;
import com.topcoder.common.web.xml.*;

public final class Authentication implements Serializable, Base {

  private Integer UserId;
  private String Status;
  private String Email;
  private String ActivationCode;
  private String Handle;
  private String Password;
  private int Attempts;
  private boolean Lockout;

  public Authentication() {
    UserId = new Integer(0);
    Status = "";
    Email = "";
    ActivationCode = "";
    Handle = "";
    Password = "";
    Attempts = 0;
    Lockout = false;
  }

  //Set
  public void setUserId(int UserId) {
    this.UserId = new Integer(UserId);
  }

  public void setStatus(String Status) {
    this.Status = Status;
  }

  public void setEmail(String Email) {
    this.Email = Email;
  }

  public void setActivationCode(String ActivationCode) {
    this.ActivationCode = ActivationCode;
  }

  public void setHandle(String Handle) {
    this.Handle = Handle;
  }

  public void setPassword(String Password) {
    this.Password = Password;
  }

  public void setAttempts(int Attempts) {
    this.Attempts = Attempts;
  }

  public void setLockout(boolean Lockout) {
    this.Lockout = Lockout;
  }




  // Get
  public Integer getUserId() {
    return UserId;
  }

  public String getStatus() {
    return Status;
  }
  
  public String getEmail() {
    return Email;
  }
  
  public String getActivationCode() {
    return ActivationCode;
  }
  
  public String getHandle() {
    return Handle;
  }
  
  public String getPassword() {
    return Password;
  }
  
  public int getAttempts() {
    return Attempts;
  }
  
  public boolean getLockout() {
    return Lockout;
  }
  
  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("Authentication");
      result.addTag( new ValueTag("UserId", UserId.intValue()) );
      result.addTag( new ValueTag("Status", Status) );
      result.addTag( new ValueTag("Email", Email) );
      result.addTag( new ValueTag("ActivationCode", ActivationCode) );
      result.addTag( new ValueTag("Handle", Handle) );
      result.addTag( new ValueTag("Password", Password) );
      result.addTag( new ValueTag("Attempts", Attempts) );
      result.addTag( new ValueTag("LockOut", Lockout) );
    } catch (Exception e)  {
      throw new Exception("common.web.data.Authentication getXML ERROR: " + e);
    }
    return result;
  }
}

