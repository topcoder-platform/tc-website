package com.topcoder.web.hs.model;

/**
 * Holds some details about the current user for the benefit of curious JSPs.
 */
public class SessionInfoBean {

  private String handle = null;
  private int userid = -1;
  /** group may be:
   * 'A' admin
   * 'G' guest
   * 'C' coach
   * 'S' student
   */
  private char group = 'G';
  private int rating = -1;

  public SessionInfoBean() { }

  public String getHandle() { return handle; }
  public void   setHandle(String handle) { this.handle = handle; }
  public int    getUserId() { return userid; }
  public void   setUserId(int userid) { this.userid = userid; }
  public char   getGroup() { return group; }
  public void   setGroup(char group) { this.userid = userid; }
  public int    getRating() { return rating; }
  public void   setRating(int rating) { this.rating = rating; }

  public boolean isLoggedIn() { return group != 'G'; }
}
