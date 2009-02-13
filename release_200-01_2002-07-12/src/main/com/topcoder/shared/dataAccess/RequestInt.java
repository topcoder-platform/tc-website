package com.topcoder.shared.dataAccess;

import java.util.Map;

/**
 * This interface must be implemented for any request wrappers.
 *
 *
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 * @author Greg Paul
 */
public interface RequestInt {
  public Map getProperties();
  public void setProperties(Map map);
  public String getProperty(String sKey);
  public String getProperty(String sKey, String sDefaultValue);
  public void setProperty(String sKey, String sVal); 
  public String toString();
}
