package com.topcoder.common.web.data;

import java.util.*;
import java.io.Serializable;
import com.topcoder.common.Log;
import com.topcoder.common.web.util.*;
import com.topcoder.common.web.xml.*;

public class User extends SecureObject
  implements Serializable, Base, PermissionAssignee, Cloneable {

  private String Handle;
  private String Password;
  private String ConfirmPassword;
  private String Status;
  private String Email;
  private ArrayList Groups;
  private UserType DefaultUserType;
  private HashMap UserTypeDetails;
  private String LoggedIn;
  private String Terms;

  public User() {
    super();
    Handle = "";
    Password = "";
    ConfirmPassword = "";
    Status = "";
    Email = "";
    Groups = new ArrayList();
    DefaultUserType = new UserType();
    UserTypeDetails = new HashMap(4);
    LoggedIn = "";
    Terms = "";
  }

  public Object clone()
    throws CloneNotSupportedException, OutOfMemoryError {
    User result = null;
    try {
      result = new User();
      result.setSId( getSId() );
      result.setSIdType( getSIdType() );
      result.setModified( getModified() );
      result.setPermissions( (ArrayList) getPermissions().clone() );
      result.setHandle( getHandle() );
      result.setPassword( getPassword() );
      result.setConfirmPassword( getConfirmPassword() );
      result.setStatus( getStatus() );
      result.setEmail( getEmail() );
      result.setGroups( (ArrayList) getGroups().clone() );
      result.setDefaultUserType( (UserType) getDefaultUserType().clone() );
      result.setUserTypeDetails( (HashMap) getUserTypeDetails().clone() );
      result.setLoggedIn( getLoggedIn() );
      result.setTerms( getTerms() );
    } catch (Exception e) {
      Log.msg("common.attr.User:clone:ERROR:\n"+e);
    }
    return result;
  }


  //Set
  public void setUserId(int UserId) {
    super.setSId(UserId);
  }

  public void setHandle(String Handle) {
    this.Handle = Handle;
  }

  public void setPassword(String Password) {
    this.Password = Password;
  }

  public void setConfirmPassword(String ConfirmPassword) {
    this.ConfirmPassword = ConfirmPassword;
  }

  public void setStatus(String Status) {
    this.Status = Status;
  }

  public void setEmail(String Email) {
    this.Email = Email;
  }

  public void setGroups(ArrayList Groups) {
    this.Groups = Groups;
  }

  public void setDefaultUserType(UserType DefaultUserType) {
    this.DefaultUserType = DefaultUserType;
  }

  public void setUserTypeDetails(HashMap UserTypeDetails) {
    this.UserTypeDetails = UserTypeDetails;
  }

  public void setLoggedIn(String LoggedIn) {
    this.LoggedIn = LoggedIn;
  }

  public void setTerms(String Terms) {
    this.Terms = Terms;
  }

  // Get
  public int getUserId() {
    return super.getSId();
  }

  public String getHandle() {
    return Handle;
  }

  public String getPassword() {
    return Password;
  }

  public String getConfirmPassword() {
    return ConfirmPassword;
  }
  
  public String getStatus() {
    return Status;
  }

  public String getEmail() {
    return Email;
  }

  public ArrayList getGroups() {
    return Groups;
  }

  public UserType getDefaultUserType() {
    return DefaultUserType;
  }

  public HashMap getUserTypeDetails() {
    return UserTypeDetails;
  }

  public String getLoggedIn() {
    return LoggedIn;
  }

  public String getTerms() {
    return Terms;
  }


  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = getXML("User");
    } catch (Exception e)  {
      throw new Exception ( "common.web.data.User:getXML:ERROR:"+e );
    }
    return result;
  }


  public RecordTag getXML( String name ) throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag(name);
      result.addTag ( new ValueTag("SId", super.getSId()) );
      result.addTag ( new ValueTag("SIdType", super.getSIdType()) );
      result.addTag ( new ValueTag("Modified", super.getModified()) );
      result.addTag ( new ValueTag("UserId", super.getSId()) );
      result.addTag ( new ValueTag("Handle", Handle) );
      result.addTag ( new ValueTag("Password", Password) );
      result.addTag ( new ValueTag("ConfirmPassword", ConfirmPassword) );
      result.addTag ( new ValueTag("Status", Status) );
      result.addTag ( new ValueTag("Email", Email) );
      result.addTag ( new ValueTag("LoggedIn", LoggedIn) );
      result.addTag ( new ValueTag("Terms", Terms) );
      result.addTag ( RecordTag.getListXML("Permissions",getPermissions()) );
      result.addTag ( RecordTag.getListXML("Groups",Groups) );
      result.addTag ( DefaultUserType.getXML() );
      result.addTag ( RecordTag.getCollectionXML("UserTypeDetails",UserTypeDetails.values()) );
    } catch (Exception e)  {
      throw new Exception("common.web.data.User:getXML(String):ERROR:\n"+e);
    }
    return result;
  }
}
