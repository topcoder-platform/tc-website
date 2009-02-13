package com.topcoder.mpsqas.common;

import java.io.*;

/**
 * A class containing information on a solution to a problem.
 *
 * @author mitalub
 */
public class SolutionInformation implements Serializable
{
  public void setSolutionId(int solutionId)
  {
    this.solutionId = solutionId;
  }

  public int getSolutionId()
  {
    return solutionId;
  }

  public void setText(String solutionText)
  {
    this.solutionText = solutionText;
  }

  public String getText()
  {
    return solutionText;
  }

  public void setHandle(String handle)
  {
    this.handle = handle;
  }

  public String getHandle()
  {
    return handle;
  }
    
  public void setPrimary(boolean isPrimary) 
  {
    this.isPrimary = isPrimary;
  }

  public boolean isPrimary()
  {
    return isPrimary;
  }

  private int solutionId;
  private String solutionText;
  private String handle;
  private boolean isPrimary;
}
