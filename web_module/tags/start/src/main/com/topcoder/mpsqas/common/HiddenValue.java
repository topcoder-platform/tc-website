package com.topcoder.mpsqas.common;

/**
 * A class used for displaying values nicely.  The actual value of the class
 * can be an id, but .toString() returns a String representing or describing
 * the id.
 *
 * @author mitalub
 */
public class HiddenValue
{
  public HiddenValue(String text, int value)
  {
    this.text = text;
    this.value = value;
  }

  public String toString()
  {
    return text;
  }

  public int getValue()
  {
    return value;
  }

  public String getFullString()
  {
    return text + ": " + value;
  }

  public void reset(String text, int value)
  {
    this.text = text;
    this.value = value;
  }

  private String text;
  private int value;
}
