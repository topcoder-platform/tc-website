package com.topcoder.shared.dataAccess;

import java.util.Map;

/**
 * This interface must be implemented for any request wrappers.
 *
 *
 * @author Greg Paul
 * @version $Revision$
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
