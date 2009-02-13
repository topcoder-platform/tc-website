package com.topcoder.shared.dataAccess;

import java.util.*;
import com.topcoder.shared.util.TCResourceBundle;

/**
 * This class provides a way to build a request for data
 * that includes a query.
 *
 * @author Greg Paul
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 *
 */
public class QueryRequest implements RequestInt {
  //generic container for mappings
  private Map mProp;

  //var for the c=someStuff
  private Map queries;

  public QueryRequest() {
    queries = new HashMap();
    mProp = new Properties();
  }

  public QueryRequest(Map map) throws Exception {
    this();
    setProperties(map);
  }

  /**
  * Gets all the property-mappings for this request bean
  * @param none
  * @return java.util.Properties
  */
  public Map getProperties() {
    return mProp;
  }

  /**
   * Sets the properties for the bean. Called in non-default
   *  constructor
   * @param Map A set of mappings
   * @return none
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
        sValue = sValue==null?"":sValue; //nulls not allowed in Properties
        if (sKey.equals(DataAccessConstants.QUERY_KEY)) {
          addQuery(sKey, sValue);
        } else mProp.put(sKey, sValue);
      } else if (me.getValue().getClass().isArray()) {
        arrayType = me.getValue().getClass().getComponentType().toString();
        // only need to handle String arrays afaik.
        if (arrayType.equals("class java.lang.String")) {
          sArray = (String[]) me.getValue();
          sKey = me.getKey().toString();
          if (sArray.length > 0) {
            if (sKey.equals(DataAccessConstants.QUERY_KEY))
              addQuery(sKey+0, sArray[0]);
            else mProp.put(sKey, sArray[0]);
          }
        }
        for(int i=1; i<sArray.length; i++) {
          if (sKey.equals(DataAccessConstants.QUERY_KEY))
            addQuery(sKey+i, sArray[i]);
          else mProp.put(sKey+i, sArray[i]);
        }
      } else {
        throw new Exception("unrecognized class " + me.getValue().getClass());
      }
    }
  }

  /**
  * Gets a specific property for this request bean
  * @param String the key for the property
  * @return String the value of the property, or null if
  *         property is unassigned.
  */
  public String getProperty(String sKey) {
    return mProp.get(sKey).toString();
  }

  /**
  * Gets a specific property for this request bean
  * @param String the key for the property
  * @param String the default value if null
  * @return String the value of the property
  */
  public String getProperty(String sKey, String sDefaultValue) {
    if (mProp.containsKey(sKey)) return mProp.get(sKey).toString();
    else return sDefaultValue; 
  }

  /**
  * Sets a specific property for this request bean
  * @param String  The property key
  * @param String   The property value
  * @return none
  */
  public void setProperty(String sKey, String sVal) {
    mProp.put(sKey, sVal);
    if (sKey.equals(DataAccessConstants.QUERY_KEY))
      addQuery(sKey, sVal);
  }

  /**
  * Gets the queries associated with this object.
  * @return Map the queries.
  */
  public Map getQueries() {
    return queries;
  }

  /**
  * Sets the queries associated with this object.
  * @param Map the queries.
  * @return none
  */
  public void setQueries(Map queries) {
    this.queries = queries;
    mProp.put(DataAccessConstants.QUERY_KEY, queries);
  }

  /**
  * Gets a particular query associated with this object.
  * @return String a key used to retrieve the query.
  */
  public String getQuery(String key) {
    return (String)queries.get(key);
  }

  /**
  * Adds the given query.
  * @param String the name of the query to be used as a key.
  * @param String the actual query.
  * @return String a key used to retrieve the query.
  */
  public void addQuery(String name, String query) {
    queries.put(name, query);
    mProp.put(DataAccessConstants.QUERY_KEY, queries);
  }

  /**
   * Implementation of toString, it includes each
   * of the key/value pairs from the properties
   * object of this object.
   */
  public String toString() {
    Iterator it = mProp.entrySet().iterator();
    Map.Entry me = null;
    StringBuffer sb = new StringBuffer();

    for( ; it.hasNext(); ) {
      me = (Map.Entry)it.next();
      sb.append(me.getKey().toString());
      sb.append('=');
      sb.append(me.getValue().toString());
    }
    return sb.toString();
  }
}
