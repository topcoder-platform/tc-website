/*
 * Preference.java
 *
 * Created on October 1, 2004, 4:02 PM
 */

package com.topcoder.web.tc.model;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author  rfairfax
 */
public class Preference implements Serializable, Comparable {
    
    private int sortOrder;
    private String text;
    private ArrayList options;
    private int type;
    
    public Preference() {
        sortOrder = 0;
        text = "";
        options = new ArrayList();
        type = 0;
    }
    
    public int getType() {
        return type;
    }
    
    public void setType(int t) {
        this.type = t;
    }
    
    public List getOptions() {
        return options;
    }
    
    public String getText() {
        return text;
    }
    
    public void setText(String t) {
        this.text = t;
    }
    
    public int getSortOrder() {
        return sortOrder;
    }
    
    public void setSortOrder(int so) {
        this.sortOrder = so;
    }
    
    public int compareTo(Object obj) {
        Preference pref = (Preference)obj;
        
        return this.getSortOrder() - pref.getSortOrder();
    }
    
    
}
