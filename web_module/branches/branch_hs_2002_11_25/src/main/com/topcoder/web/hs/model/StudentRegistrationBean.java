package com.topcoder.web.hs.model;

import java.io.*;
import java.util.*;

public class StudentRegistrationBean implements Serializable {

  private String first_name=null;

  private String last_name=null;

  private String state_code=null;

  private String school_id=null;

  private String handle=null;

  private String password=null;

  private String confirm_password=null;

  private String email=null;

  private String confirm_email=null;

  private String editor_id=null;

  private String language_id=null;

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

  public String getSchoolId() {
    return(school_id);
  }

  public void setSchoolId(String _school_id) {
    school_id=_school_id;
  }

  public String getHandle() {
    return(handle);
  }

  public void setHandle(String _handle) {
    handle=_handle;
  }

  public String getPassword() {
    return(password);
  }

  public void setPassword(String _password) {
    password=_password;
  }

  public String getConfirmPassword() {
    return(confirm_password);
  }

  public void setConfirmPassword(String _confirm_password) {
    confirm_password=_confirm_password;
  }

  public String getEmail() {
    return(email);
  }

  public void setEmail(String _email) {
    email=_email;
  }

  public String getConfirmEmail() {
    return(confirm_email);
  }

  public void setConfirmEmail(String _confirm_email) {
    confirm_email=_confirm_email;
  }

  public String getEditorId() {
    return(editor_id);
  }

  public void setEditorId(String _editor_id) {
    editor_id=_editor_id;
  }

  public String getLanguageId() {
    return(language_id);
  }

  public void setLanguageId(String _language_id) {
    language_id=_language_id;
  }

  public List getStateList() {
    return(state_list);
  }

  public void setStateList(List _state_list) {
    state_list=_state_list;
  }

  public List getSchoolList() {
    return(school_list);
  }

  public void setSchoolList(List _school_list) {
    school_list=_school_list;
  }

  public List getEditorList() {
    return(editor_list);
  }

  public void setEditorList(List _editor_list) {
    editor_list=_editor_list;
  }

  public List getLanguageList() {
    return(language_list);
  }

  public void setLanguageList(List _language_list) {
    language_list=_language_list;
  }

};
