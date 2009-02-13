package com.topcoder.web.stat.bean;

import java.util.*;
import com.topcoder.web.stat.common.StatisticsQueries;

/**
 * This class is a generic request-bean.  It serves as a container for all
 * information that is parsed out of the request.  Note that each key must be unique
 * so if you have 2 coder ids, you need coderA and coderB.
 * 
 *
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1.2.1  2002/03/16 20:18:09  gpaul
 *           moving these over from the member dev area.
 *
 *           Revision 1.1  2002/02/06 04:11:01  tbone
 *           TCB - added to cvs
 *
 */
public class StatRequestBean {
	//generic container for mappings
	private Properties mProp;
	
	//var for the c=someStuff
	private String msContentHandle;
	
	
	public StatRequestBean() {
		msContentHandle = ""; mProp = new Properties();
	}
	
	public StatRequestBean(Map map) {
		this();
		setProperties(map);
	}
	
	/**
	* Gets all the property-mappings for this request bean
	* @param none
	* @return java.util.Properties
	*/
	public Properties getProperties() {
		return mProp;
	}
	
	/** 
	 * Sets the properties for the bean. Called in non-default 
	 *  constructor
	 * @param Map A set of mappings
	 * @return none
	 */
	public void setProperties(Map map) {
		Map.Entry entry;
		Iterator it = map.entrySet().iterator();
		String sKey = "";
		String sValue = (String)map.get(StatisticsQueries.COMMAND_ID);
		msContentHandle = sValue==null?msContentHandle:sValue;
		while (it.hasNext()) {
			entry = (Map.Entry) it.next();
			sKey = entry.getKey().toString(); //maps can't have null-key
			sValue = (String) entry.getValue();
			sValue = sValue==null?"":sValue; //nulls not allowed in Properties
			mProp.put(sKey, sValue);
		}
	}
	
	/**
	* Gets the content handle for this request bean
	* @param none
	* @return String
	*/
	public String getContentHandle() {
		return msContentHandle;
	}
	
	/**
	* Sets the content handle for this request bean
	* @param String
	* @return none
	*/
	public void setContentHandle(String s) {
		msContentHandle = s;
		mProp.setProperty(StatisticsQueries.COMMAND_ID, s);
	}
	
	/**
	* Gets a specific property for this request bean
	* @param String the key for the property
	* @return String the value of the property, or null if
	*         property is unassigned.
	*/
	public String getProperty(String sKey) {
		return mProp.getProperty(sKey);
	}

	/**
	* Gets a specific property for this request bean
	* @param String the key for the property
	* @param String the default value if null
	* @return String the value of the property
	*/
	public String getProperty(String sKey, String sDefaultValue) {
		return mProp.getProperty(sKey, sDefaultValue);
	}
		
	/**
	* Sets a specific property for this request bean
	* @param String  The property key
	* @param String	 The property value
	* @return none
	*/
	public void setProperty(String sKey, String sVal) {
		mProp.setProperty(sKey, sVal);
		if (sKey.equals(StatisticsQueries.COMMAND_ID)) 
			msContentHandle = sVal;
	}
}