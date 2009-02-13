package com.topcoder.common.web.data;

import com.topcoder.common.web.xml.*;
import com.topcoder.common.web.util.*;
import java.util.ArrayList;
import java.io.Serializable;


public class UserType implements Serializable, Base, Cloneable {

  private int UserTypeId;
  private String UserTypeDesc;
  private String Modified;

  public UserType() {
    UserTypeId = 0;
    UserTypeDesc = "";
    Modified = "";
  }


  public Object clone()
    throws CloneNotSupportedException, OutOfMemoryError {
    UserType result = null;
    try {
      result = new UserType();
      result.setUserTypeId( getUserTypeId() );
      result.setUserTypeDesc( getUserTypeDesc() );
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
    if ( getModified().equals("") ) setModified("A");
  }

  //////////////////////////////////////////////////////////////////////////
  public void submitUserTypeId(String UserTypeId) throws Exception {
  //////////////////////////////////////////////////////////////////////////
    try {
      int intUserTypeId = Integer.parseInt(UserTypeId);
      if (getUserTypeId()!=intUserTypeId) toggleModified();
      setUserTypeId( intUserTypeId );
    }catch (Exception e)  {
      throw new Exception
        ("common.Registration:submitUserTypeId:ERROR: " + e);
    }
  }

  //////////////////////////////////////////////////////////////////////////
  public void submitUserTypeDesc(String UserTypeDesc) {
  //////////////////////////////////////////////////////////////////////////
    String nonNullUserTypeDesc = Conversion.clean(UserTypeDesc);
    if ( !Conversion.clean(getUserTypeDesc()).equals(nonNullUserTypeDesc) ) toggleModified();
    setUserTypeDesc( nonNullUserTypeDesc );
  }


  //Set
  public void setUserTypeId(int UserTypeId) {
    this.UserTypeId = UserTypeId;
  }

  public void setUserTypeDesc(String UserTypeDesc) {
    this.UserTypeDesc = UserTypeDesc;
  }

  public void setModified(String Modified) {
    this.Modified = Modified;
  }

  // Get
  public int getUserTypeId() {
    return UserTypeId;
  }

  public String getUserTypeDesc() {
    return UserTypeDesc;
  }

  public String getModified() {
    return Modified;
  }

  public RecordTag getXML() throws Exception {
    RecordTag result = null;
    try {
      result = getUserTypeXML();
    } catch (Exception e) {
      throw new Exception("common.web.data.UserType:getXML:ERROR:\n"+e);
    }
    return result;
  }
  
  protected RecordTag getUserTypeXML() throws Exception {
    RecordTag result = null;
    try {
      result = new RecordTag("UserType");
      result.addTag( new ValueTag("UserTypeId", UserTypeId) );
      result.addTag( new ValueTag("UserTypeDesc", UserTypeDesc) );
      result.addTag( new ValueTag("Modified", Modified) );
    } catch (Exception e)  {
      throw new Exception("common.web.data.UserType:getUserTypeXML:ERROR:\n"+e);
    }
    return result;
  }
}
