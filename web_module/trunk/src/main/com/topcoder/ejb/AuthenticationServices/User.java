package com.topcoder.ejb.AuthenticationServices;


public class User 
  extends SecureObject
  implements java.io.Serializable, PermissionAssignee, Cloneable {


  private String Handle;
  private String Password;
  private String ConfirmPassword;
  private String Status;
  private String Email;
  private java.util.ArrayList Groups;
  private UserType DefaultUserType;
  private java.util.HashMap UserTypeDetails;
  private String LoggedIn;
  private String Terms;


  public User() {
    super();
    Handle = "";
    Password = "";
    ConfirmPassword = "";
    Status = "";
    Email = "";
    Groups = new java.util.ArrayList();
    DefaultUserType = new UserType();
    UserTypeDetails = new java.util.HashMap(4);
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
      result.setPermissions( (java.util.ArrayList) getPermissions().clone() );
      result.setHandle( getHandle() );
      result.setPassword( getPassword() );
      result.setConfirmPassword( getConfirmPassword() );
      result.setStatus( getStatus() );
      result.setEmail( getEmail() );
      result.setGroups( (java.util.ArrayList) getGroups().clone() );
      result.setDefaultUserType( (UserType) getDefaultUserType().clone() );
      result.setUserTypeDetails( (java.util.HashMap) getUserTypeDetails().clone() );
      result.setLoggedIn( getLoggedIn() );
      result.setTerms( getTerms() );
    } catch (Exception e) {
      e.printStackTrace();
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

  public void setGroups(java.util.ArrayList Groups) {
    this.Groups = Groups;
  }

  public void setDefaultUserType(UserType DefaultUserType) {
    this.DefaultUserType = DefaultUserType;
  }

  public void setUserTypeDetails(java.util.HashMap UserTypeDetails) {
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

  public java.util.ArrayList getGroups() {
    return Groups;
  }

  public UserType getDefaultUserType() {
    return DefaultUserType;
  }

  public java.util.HashMap getUserTypeDetails() {
    return UserTypeDetails;
  }

  public String getLoggedIn() {
    return LoggedIn;
  }

  public String getTerms() {
    return Terms;
  }



}
