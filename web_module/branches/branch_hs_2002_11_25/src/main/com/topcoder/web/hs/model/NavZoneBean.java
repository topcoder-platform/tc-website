package com.topcoder.web.hs.model;

/**
 * This is not model.  Other JSPs use it to tell left_nav what submenu to render open.
 */
public class NavZoneBean {

  private String zone =  "null";

  public NavZoneBean() { }

  public String getZone() { return zone; }
  public void   setZone(String zone) { this.zone = zone==null?"null":zone; }

  public boolean inStats() { return zone.toLowerCase().equals("stats"); }
  public boolean inFaq()   { return zone.toLowerCase().equals("faq"); }
  public boolean inAbout() { return zone.toLowerCase().equals("about"); }
}
