package com.topcoder.web.hs.model;

import java.io.*;
import java.util.*;

public class StudentRegistrationBean implements Serializable {

  private String first_name=null;

  private String last_name=null;

  private String state_code=null;

  private Integer school_id=null;

  private String handle=null;

  private String password=null;

  private String email=null;

  private Integer editor_id=null;

  private Integer language_id=null;

  private List state_list=null;

  private List school_list=null;

  private List editor_list=null;

  private List language_list=null;

  public StudentRegistrationBean() {
    /* do nothing */
  }

  public String getFirstName() {
    return(first_name);
  }

  public void setFirstName(String _first_name) {
    first_name=_first_name;
  }

  public String getLastName() {
    return(last_name);
  }

  public void setLastName(String _last_name) {
    last_name=_last_name;
  }

  public String getStateCode() {
    return(state_code);
  }

  public void setStateCode(String _state_code) {
    state_code=_state_code;
  }

  public Integer getSchoolId() {
    return(school_id);
  }

  public void setSchoolId(Integer _school_id) {
    school_id=_school_id;
  }

  public String getHandle() {
    return(handle);
  }

  public void setHandle(String _handle) {
    handle=_handle;
  }

  public String getEmail() {
    return(email);
  }

  public void setEmail(String _email) {
    email=_email;
  }

  public Integer getEditorId() {
    return(editor_id);
  }

  public void setEditorId(Integer _editor_id) {
    editor_id=_editor_id;
  }

  public Integer getLanguageId() {
    return(language_id);
  }

  public void setLanguageId(Integer _language_id) {
    language_id=_language_id;
  }
};
