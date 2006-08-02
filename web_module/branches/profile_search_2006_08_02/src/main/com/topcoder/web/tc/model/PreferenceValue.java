/*
 * PreferenceValue.java
 *
 * Created on October 1, 2004, 4:48 PM
 */

package com.topcoder.web.tc.model;

import java.io.Serializable;


/**
 *
 * @author  rfairfax
 */
public class PreferenceValue implements Serializable {

    private String text;
    private int id;

    public PreferenceValue() {
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

}
