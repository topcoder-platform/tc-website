package com.topcoder.shared.dataAccess;

import java.util.Map;

/**
 * This interface must be implemented for any request wrappers.
 *
 *
 * @version $Revision$
 *  Log of Changes:
 *           $Log$
 *           Revision 1.2  2002/07/18 23:58:14  gpaul
 *           changed toString method and throw exception if setProperties goes wrong
 *
 *           Revision 1.1  2002/07/03 00:30:22  gpaul
 *           moving over here
 *
 * @author Greg Paul
 */
public interface RequestInt {
    /**
     *
     * @return
     */
    public Map getProperties();

    /**
     *
     * @param map
     * @throws Exception
     */
    public void setProperties(Map map) throws Exception;

    /**
     *
     * @param sKey
     * @return
     */
    public String getProperty(String sKey);

    /**
     *
     * @param sKey
     * @param sDefaultValue
     * @return
     */
    public String getProperty(String sKey, String sDefaultValue);

    /**
     *
     * @param sKey
     * @param sVal
     */
    public void setProperty(String sKey, String sVal);

    /**
     *
     * @return
     */
    public String toString();
}
