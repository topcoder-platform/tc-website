/*
 * PreferenceValue.java
 *
 * Created on October 1, 2004, 4:48 PM
 */

package com.topcoder.web.tc.model;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author  rfairfax
 */
public class PreferenceValue implements Serializable, Comparable {
    
    private int sortOrder;
    private String text;
    private int id;
    
    public PreferenceValue() {
        sortOrder = 0;
        text = "";
        id = 0;
    }
    
    public int getID() {
        return id;
    }
    
    public void setID(int id) {
        this.id = id;
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
        PreferenceValue pv = (PreferenceValue)obj;
        return this.getSortOrder() - pv.getSortOrder();
    }
    
}
