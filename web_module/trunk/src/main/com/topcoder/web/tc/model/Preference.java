/*
 * Preference.java
 *
 * Created on October 1, 2004, 4:02 PM
 */

package com.topcoder.web.tc.model;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.List;
import java.util.Collections;
/**
 *
 * @author  rfairfax
 */
public class Preference implements Serializable {
    
    private String text;
    private ArrayList options;
    private int type;
    
    public Preference() {
        text = "";
        options = new ArrayList();
        type = 0;
    }
    
    public void addPrefValue(PreferenceValue pv) {
        options.add(pv);
    }
    
    public int getType() {
        return type;
    }
    
    public void setType(int t) {
        this.type = t;
    }
    
    public List getPrefValues() {
        return options;
    }
    
    public String getText() {
        return text;
    }
    
    public void setText(String t) {
        this.text = t;
    }
    
}
