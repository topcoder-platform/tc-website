package com.topcoder.web.hs.model;

import java.util.*;

/**
 * This is not model.  Other JSPs use it to tell left_nav what submenu to render open.
 *
 * @author Ambrose Feinstein
 */
public class NavZoneBean implements Serializable {

    private ArrayList folder = new ArrayList();

    public NavZoneBean() { }

    public String getFolder(int i) {
        if(i >= folder.size()) return "";
        String r = (String)folder.get(i);
        if(r==null) return "";
        return r;
    }

    public void setFolder(int i, String s) {
        if(s==null || s.equals("")) {
            folder.removeRange(i, folder.size());
        } else {
           while(folder.size() <= i) folder.add(null);
           folder.set(i, s);
        }
    }

    public String getFolder() { return getFolder(0); }

    public void setFolder(String f) { setFolder(0, f); }
}
