package com.topcoder.web.hs.model;

import java.util.*;

public class SearchBean {

  private final static int MAX_RESULTS_PER_PAGE=15;

  private int prev=0;

  private int next=MAX_RESULTS_PER_PAGE;

  private String handle=null;

  private String state_code=null;

  private Long school_id=null;

  private Integer min_rating=null;

  private Integer max_rating=null;

  private List state_list=null;

  public int getMaxResultsPerPage() {
    return(MAX_RESULTS_PER_PAGE);
  }

  public int getPrev() {
    return(prev);
  }

  public void setPrev(int _prev) {
    prev=_prev;
  }

  public int getNext() {
    return(next);
  }

  public void setNext(int _next) {
    next=_next;
  }

  public String getHandle() {
    return(handle);
  }

  public void setHandle(String _handle) {
    handle=_handle;
  }

  public String getStateCode() {
    return(state_code);
  }

  public void setStateCode(String _state_code) {
    state_code=_state_code;
  }

  public Long getSchoolId() {
    return(school_id);
  }

  public void setSchoolId(Long _school_id) {
    school_id=_school_id;
  }

  public Integer getMinRating() {
    return(min_rating);
  }

  public void setMinRating(Integer _min_rating) {
    min_rating=_min_rating;
  }

  public Integer getMaxRating() {
    return(max_rating);
  }

  public void setMaxRating(Integer _max_rating) {
    max_rating=_max_rating;
  }

  public List getStateList() {
    return(state_list);
  }

  public void setStateList(List _state_list) {
    state_list=_state_list;
  }

};
