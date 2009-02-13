package com.topcoder.mpsqas.common;

import java.io.*;

/**
 * A class to hold information about a developement application.
 *
 * @author mitalub
 */
public class ApplicationInformation implements Serializable
{
  public String getHandle()
  { 
    return handle;
  }

  public int getRating()
  {
    return rating;
  }

  public int getEvents()
  {
    return events;
  }

  public String getName()
  {
    return name;
  }

  public String getEmail()
  {
    return email;
  }

  public String getMessage()
  {
    return message;
  }

  public String getApplicationType()
  {
    return applicationType;
  }

  public void setHandle(String in)
  {
    handle=in;
  }

  public void setRating(int in)
  {
    rating=in;
  }

  public void setEvents(int in)
  {
    events=in;
  }

  public void setName(String in)
  {
    name=in;
  }

  public void setMessage(String in)
  {
    message=in;
  }

  public void setEmail(String in)
  {
    email=in;
  }

  public void setApplicationType(String in)
  {
    applicationType=in;
  }

  public void setId(int id)
  {
    this.id = id;
  }

  public int getId()
  {
    return id;
  }

  private String handle;
  private int rating;
  private int events;
  private String name;
  private String email;
  private String message;
  private String applicationType;
  private int id;
}
