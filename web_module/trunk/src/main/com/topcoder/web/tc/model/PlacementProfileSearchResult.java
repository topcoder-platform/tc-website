/*
 * PlacementProfileSearchResult.java
 *
 * Created on December 9, 2004, 11:42 AM
 */

package com.topcoder.web.tc.model;

/**
 *
 * @author rfairfax
 */
import java.io.Serializable;

public class PlacementProfileSearchResult implements Serializable {
    
    private String handle;
    private String first_name;
    private String last_name;
    private int id;
    
    /** Creates a new instance of PlacementProfileSearchResult */
    public PlacementProfileSearchResult() {
        handle = "";
        first_name = "";
        last_name = "";
        id = 0;
    }
    
    public PlacementProfileSearchResult(int id, String handle, String first_name, String last_name) {
        this.handle = handle ;
        this.first_name = first_name ;
        this.last_name = last_name;
        this.id = id;
    }
    
    public void setFirstName(String f) {
        first_name = f;
    }
    
    public String getFirstName() {
        return first_name;
    }
    
    public void setLastName(String l) {
        last_name = l;
    }
    
    public String getLastName() {
        return last_name;
    }
    
    public void setHandle(String t) {
        handle = t;
    }
    
    public void setID(int i) {
        id = i;
    }
    
    public int getID() {
        return id;
    }
    
    public String getHandle() {
        return handle;
    }
    
}