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
public class Skill implements Serializable, Comparable {

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
    
    public boolean equals(Object o) {
        if(!(o instanceof Skill))
            return false;
        
        Skill s = (Skill)o;
        return s.getID() == getID();
    }
    
    public int compareTo(Object o) {
        Skill s = (Skill)o;
        return this.getText().compareToIgnoreCase(s.getText());
    }
}
