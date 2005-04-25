/*
 * PreferenceGroup.java
 *
 * Created on October 1, 2004, 2:24 PM
 */

package com.topcoder.web.tc.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author  rfairfax
 */
public class PreferenceGroup implements Serializable {

    private String name;
    private ArrayList prefs;

    /** Creates a new instance of PreferenceGroup */
    public PreferenceGroup() {
        name = "";
        prefs = new ArrayList();
    }

    public void addPreference(Preference p) {
        prefs.add(p);
    }

    public List getPrefs() {
        return prefs;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


}
