/*
 * ContractingInfo.java
 *
 * Created on October 1, 2004, 11:51 AM
 */

package com.topcoder.web.tc.model;

import java.io.Serializable;
import java.util.*;
import com.topcoder.servlet.request.*;
/**
 *
 * @author  rfairfax
 */
public class ContractingInfo implements Serializable {
    
    private long userID;
    private Hashtable preferences;
    private UploadedFile resume;
    
    /** Creates a new instance of ContractingInfo */
    public ContractingInfo() {
        userID = 0;
        preferences = new Hashtable();
        resume = null;
    }
    
    public void setResume(UploadedFile u) {
        resume = u;
    }
    
    public UploadedFile getResume() {
        return resume;
    }
    
    public void setUserID(long u) {
        userID = u;
    }
    
    public void clearPreferences() {
        preferences.clear();
    }
    
    public Iterator getPreferenceNames() {
        return preferences.keySet().iterator();
    }
    
    public void setPreference(String pref, String val) {
        preferences.put(pref, val);
    }
    
    public String getPreference(String pref) {
        return (String)preferences.get(pref);
    }
    
    public long getUserID() {
        return userID;
    }
    
}
