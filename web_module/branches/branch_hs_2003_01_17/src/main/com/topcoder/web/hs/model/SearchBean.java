package com.topcoder.web.hs.model;

import java.util.*;

public class SearchBean {

  private final static int MAX_RESULTS_PER_PAGE=15;

  private Integer prev=null;

  private Integer next=null;

  private String handle=null;

  private String state_code=null;

  private Long school_id=null;

  private String min_rating=null;

  private String max_rating=null;

  private List state_list=null;

  private List school_list=null;

  private List member_list=null;

  private Long total_members=null;

  public static int getMaxResultsPerPage() {
    return(MAX_RESULTS_PER_PAGE);
  }

  public Integer getPrev() {
    return(prev);
  }

  public void setPrev(Integer _prev) {
    prev=_prev;
  }

  public Integer getNext() {
    return(next);
  }

  public void setNext(Integer _next) {
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

  public String getMinRating() {
    return(min_rating);
  }

  public void setMinRating(String _min_rating) {
    min_rating=_min_rating;
  }

  public String getMaxRating() {
    return(max_rating);
  }

  public void setMaxRating(String _max_rating) {
    max_rating=_max_rating;
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

  public List getMemberList() {
    return(member_list);
  }

  public void setMemberList(List _member_list) {
    member_list=_member_list;
  }

  public Long getTotalMembers() {
    return(total_members);
  }

  public void setTotalMembers(Long _total_members) {
    total_members=_total_members;
  }
};
