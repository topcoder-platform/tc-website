package com.topcoder.shared.dataAccess;

import com.topcoder.shared.util.TCResourceBundle;

import java.util.*;

/**
 * This class is a generic request-bean.  It serves as a container for all
 * information that is parsed out of the request.  Note that each key must be unique
 * so if you have 2 coder ids, you need coderA and coderB.
 *
 * @author tbone
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
 *           Revision 1.4  2002/06/13 18:53:43  lbackstrom
 *           distributed cache
 *
 *           Revision 1.3  2002/06/12 18:02:56  lbackstrom
 *           added toString method for use as cache key
 *
 *           Revision 1.2  2002/05/30 14:44:47  gpaul
 *           changed StatRequestBean to have a better construstor that would be able to parse the Map produced by HttpUtils on a request.queryString
 *
 *           Revision 1.1.1.1  2002/04/02 17:20:38  steveb
 *           initial web load into cvs
 *
 *           Revision 1.1.2.1  2002/03/16 20:18:09  gpaul
 *           moving these over from the member dev area.
 *
 *           Revision 1.1  2002/02/06 04:11:01  tbone
 *           TCB - added to cvs
 *
 */
public class Request implements RequestInt {
    //generic container for mappings
    private Properties mProp;

    //var for the c=someStuff
    private String msContentHandle;

    private static TCResourceBundle bundle;
    private static String COMMAND_KEY;

    /**
     * Default constructor
     */
    public Request() {
        msContentHandle = "";
        mProp = new Properties();
        if (bundle == null)
            bundle = new TCResourceBundle("DataAccess");
        COMMAND_KEY = bundle.getProperty("COMMAND", "c");
    }

    /**
     * Constructor that takes a map and sets this object's
     * properties using that map.
     * @param map
     * @throws Exception
     */
    public Request(Map map) throws Exception {
        this();
        setProperties(map);
        if (bundle == null)
            bundle = new TCResourceBundle("DataAccess");
        COMMAND_KEY = bundle.getProperty("COMMAND", "c");
    }

    /**
     * Gets all the property-mappings for this request bean
     * @return java.util.Properties
     */
    public Map getProperties() {
        return mProp;
    }

    /**
     * Sets the properties for the bean. Called in non-default
     *  constructor
     * @param map A set of mappings
     * @throws Exception
     */
    public void setProperties(Map map) throws Exception {
        Iterator it = map.entrySet().iterator();
        Map.Entry me = null;
        String[] sArray = null;
        String sKey = null;
        String sValue = null;
        String arrayType = null;

        while (it.hasNext()) {
            me = (Map.Entry) it.next();
            if (me.getValue() instanceof String) {
                sKey = me.getKey().toString(); //maps can't have null-key
                sValue = (String) me.getValue();
                sValue = sValue == null?"":sValue; //nulls not allowed in Properties
                if (sKey.equals(COMMAND_KEY))
                    setContentHandle(sValue);
                else
                    mProp.put(sKey, sValue);
            } else if (me.getValue().getClass().isArray()) {
                arrayType = me.getValue().getClass().getComponentType().toString();
                // only need to handle String arrays afaik.
                if (arrayType.equals("class java.lang.String")) {
                    sArray = (String[]) me.getValue();
                    sKey = me.getKey().toString();
                    if (sArray.length > 0) {
                        if (sKey.equals(COMMAND_KEY))
                            setContentHandle(sArray[0]);
                        else
                            mProp.put(sKey, sArray[0]);
                    }
                    for (int i = 1; i < sArray.length; i++) {
                        mProp.put(sKey + i, sArray[i]);
                    }
                }
            } else {
                throw new Exception("unrecognized class " + me.getValue().getClass());
            }
        }
    }

    /**
     * Gets the content handle for this request bean
     * @return String
     */
    public String getContentHandle() {
        return msContentHandle;
    }

    /**
     * Sets the content handle for this request bean
     * @param s
     */
    public void setContentHandle(String s) {
        msContentHandle = s;
        mProp.setProperty(COMMAND_KEY, s);
    }

    /**
     * Gets a specific property for this request bean
     * @param sKey the key for the property
     * @return the value of the property, or null if
     *         property is unassigned.
     */
    public String getProperty(String sKey) {
        return mProp.getProperty(sKey);
    }

    /**
     * Gets a specific property for this request bean
     * @param sKey the key for the property
     * @param sDefaultValue the default value if null
     * @return String the value of the property
     */
    public String getProperty(String sKey, String sDefaultValue) {
        return mProp.getProperty(sKey, sDefaultValue);
    }

    /**
     * Sets a specific property for this request bean
     * @param sKey The property key
     * @param sVal The property value
     */
    public void setProperty(String sKey, String sVal) {
        mProp.setProperty(sKey, sVal);
        if (sKey.equals(COMMAND_KEY))
            msContentHandle = sVal;
    }

    /**
     * Implementation of toString, it includes each
     * of the key/value pairs from the properties
     * object of this object.
     * @return a string representation of this object
     */
    public String toString() {
        Iterator it = mProp.entrySet().iterator();
        Map.Entry me = null;
        StringBuffer sb = new StringBuffer();

        for (; it.hasNext();) {
            me = (Map.Entry) it.next();
            sb.append(me.getKey().toString());
            sb.append('=');
            sb.append(me.getValue().toString());
        }
        return sb.toString();
    }
}
