/*
 * ContractingInfo.java
 *
 * Created on October 1, 2004, 11:51 AM
 */

package com.topcoder.web.tc.model;

import com.topcoder.servlet.request.UploadedFile;

import java.io.Serializable;
import java.util.Hashtable;
import java.util.Iterator;

/**
 *
 * @author  rfairfax
 */
public class ContractingInfo implements Serializable, Cloneable {

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

    public void removePref(String pref) {
        preferences.remove(pref);
    }

    public void setNote(String note, String val) {
        notes.put(note, val);
    }

    public String getNote(String note) {
        return (String) notes.get(note);
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
        return (String) skills.get(skill);
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

    public int getSkillCount() {
        return skills.keySet().size();
    }

    public Iterator getPreferenceNames() {
        return preferences.keySet().iterator();
    }

    public void setPreference(String pref, String val) {
        preferences.put(pref, val);
    }

    public String getPreference(String pref) {
        return (String) preferences.get(pref);
    }

    public long getUserID() {
        return userID;
    }

    public Object clone() {
        ContractingInfo newInfo = new ContractingInfo();
        newInfo.setEdit(isEdit());
        newInfo.setUserID(getUserID());
        newInfo.setResume(getResume());

        Iterator i = getNoteNames();
        while (i.hasNext()) {
            String s = (String) i.next();

            newInfo.setNote(s, getNote(s));
        }

        i = getPreferenceNames();
        while (i.hasNext()) {
            String s = (String) i.next();

            newInfo.setPreference(s, getPreference(s));
        }

        i = getSkillNames();
        while (i.hasNext()) {
            String s = (String) i.next();

            newInfo.setSkill(s, getSkill(s));
        }

        return newInfo;
    }

}
