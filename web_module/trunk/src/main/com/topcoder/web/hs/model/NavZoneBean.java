package com.topcoder.web.hs.model;

import java.io.*;
import java.util.*;

/**
 * This bean maintains a list of Strings, representing a path on the web site.
 * The left_nav JSP uses this context information to vary rendering of a multilevel menu.
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
            while(folder.size() > i) folder.remove(folder.size()-1);
        } else {
           while(folder.size() <= i) folder.add(null);
           folder.set(i, s);
        }
    }

    public String[] getFolder() {
        return (String[])folder.toArray(new String[0]);
    }

    public void setFolder(String[] s) {
        folder = new ArrayList(Arrays.asList(s));
    }

    public int getDepth() {
        return folder.size();
    }

    public void setDepth(int d) {
        setFolder(d, null);
    }

    public String getRoot() { return getFolder(0); }
    public void setRoot(String s) { setFolder(0, s); }

    public String getLevel0() { return getFolder(0); }
    public void setLevel0(String s) { setFolder(0, s); }
    public String getLevel1() { return getFolder(1); }
    public void setLevel1(String s) { setFolder(1, s); }
    public String getLevel2() { return getFolder(2); }
    public void setLevel2(String s) { setFolder(2, s); }
    public String getLevel3() { return getFolder(3); }
    public void setLevel3(String s) { setFolder(3, s); }

    public void setAll(String s) {
        setFolder(0, s);
        setDepth(1);
    }
    public void setAll(String s, String t) {
        setFolder(0, s);
        setFolder(1, t);
        setDepth(2);
    }
    public void setAll(String s, String t, String u) {
        setFolder(0, s);
        setFolder(1, t);
        setFolder(2, u);
        setDepth(3);
    }
}
