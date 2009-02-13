/*
 * Skill.java
 *
 * Created on October 5, 2004, 3:33 PM
 */

package com.topcoder.web.tc.model;


import java.io.Serializable;

/**
 *
 * @author  rfairfax
 */
public class Skill implements Serializable {

    private String text;
    private int id;

    /** Creates a new instance of Skill */
    public Skill() {
        text = "";
        id = 0;
    }

    public void setText(String t) {
        text = t;
    }

    public void setID(int i) {
        id = i;
    }

    public int getID() {
        return id;
    }

    public String getText() {
        return text;
    }

}
