package com.topcoder.web.hs.model;

/**
 * Holds some details about the current user for the benefit of curious JSPs.
 */
public class SessionInfoBean {

  private String handle = null;
  private int userid = -1;
  /** group may be:
   * 'G' guest
   * 'S' student
   * 'C' coach
   * 'A' admin
   */
  private char group = 'G';
  private int rating = -1;

  public SessionInfoBean() { }

  public String getHandle() { return handle; }
  public void   setHandle(String handle) { this.handle = handle; }
  public int    getUserId() { return userid; }
  public void   setUserId(int userid) { this.userid = userid; }
  public char   getGroup() { return group; }
  public void   setGroup(char group) {
    if(0>"GSCA".indexOf(group)) throw new IllegalArgumentException("no group class '"+group+"'");
    this.group = group;
  }
  public int    getRating() { return rating; }
  public void   setRating(int rating) { this.rating = rating; }

  public boolean isLoggedIn() { return group != 'G'; }
  public boolean isGuest()    { return group == 'G'; }
  public boolean isStudent()  { return group == 'S'; }
  public boolean isCoach()    { return group == 'C'; }
  public boolean isAdmin()    { return group == 'A'; }
}
