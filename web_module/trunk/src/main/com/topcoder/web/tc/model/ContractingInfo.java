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
    private Hashtable skills;
    private Hashtable notes;
    private UploadedFile resume;
    private boolean edit;
    
    /** Creates a new instance of ContractingInfo */
    public ContractingInfo() {
        userID = 0;
        preferences = new Hashtable();
        skills = new Hashtable();
        notes = new Hashtable();
        resume = null;
        edit = false;
    }
    
    public void setNote(String note, String val) {
        notes.put(note, val);
    }
    
    public String getNote(String note) {
        return (String)notes.get(note);
    }
    
    public void removeNote(String note) {
        notes.remove(note);
    }
    
    public Iterator getNoteNames() {
        return notes.keySet().iterator();
    }
    
    public void clearSkills() {
        skills.clear();
    }
    
    public void setSkill(String skill, String val) {
        skills.put(skill, val);
    }
    
    public String getSkill(String skill) {
        return (String)skills.get(skill);
    }
    
    public void removeSkill(String skill) {
        skills.remove(skill);
    }
    
    public Iterator getSkillNames() {
        return skills.keySet().iterator();
    }
    
    public boolean isEdit() {
        return edit;
    }
    
    public void setEdit(boolean b) {
        edit = b;
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
