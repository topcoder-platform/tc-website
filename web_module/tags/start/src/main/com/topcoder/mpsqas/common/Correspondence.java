package com.topcoder.mpsqas.common;

import java.io.*;

/**
 * Correspondence is a class to represent a MPSQAS message - "email"
 * and holds the information about the email.
 *
 * @author mitalub
 */
public class Correspondence implements Serializable
{
  /**
   * The constructor stores all the information about the message
   */
  public Correspondence()
  {
  }

  /**
   * setMessage sets the text message of the correspondence.
   *
   * @param text  The message
   */
  public void setMessage(String text)
  {
    message=text;
  }

  /**
   * getMessage gets the text message.
   */
  public String getMessage()
  {
    return message;
  }

  /**
   * setSender sets the name of the person who sent the message.
   *
   * @param sender Sender's name
   */
  public void setSender(String sender)
  {
    this.sender=sender;
  }

  /**
   * getSender returns the message's sender.
   */
  public String getSender()
  {
    return sender;
  }

  /**
   * setDate sets the date of the message
   *
   * @param date  The date of the message
   */
  public void setDate(String date)
  {
    this.date=date;
  }

  /**
   * getDate returns the date of the message
   */
  public String getDate()
  {
    return date;
  }
  private String date;
  private String sender;
  private String message;
}
