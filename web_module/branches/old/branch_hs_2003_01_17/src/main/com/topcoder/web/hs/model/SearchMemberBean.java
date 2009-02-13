package com.topcoder.web.hs.model;

import java.util.*;

public class SearchMemberBean {

  private Long user_id=null;

  private String handle=null;

  private Integer rating=null;

  private String state_code=null;

  private String school_name=null;

  private Date last_competed=null;

  public SearchMemberBean() {
    /* do nothing */
  }

  public Long getUserId() {
    return(user_id);
  }

  public void setUserId(Long _user_id) {
    user_id=_user_id;
  }

  public String getHandle() {
    return(handle);
  }

  public void setHandle(String _handle) {
    handle=_handle;
  }

  public Integer getRating() {
    return(rating);
  }

  public void setRating(Integer _rating) {
    rating=_rating;
  }

  public String getStateCode() {
    return(state_code);
  }

  public void setStateCode(String _state_code) {
    state_code=_state_code;
  }

  public String getSchoolName() {
    return(school_name);
  }

  public void setSchoolName(String _school_name) {
    school_name=_school_name;
  }

  public Date getLastCompeted() {
    return(last_competed);
  }

  public void setLastCompeted(Date _last_competed) {
    last_competed=_last_competed;
  }

};
