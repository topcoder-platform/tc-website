package com.topcoder.web.tc.model;

import java.io.Serializable;
import java.util.*;
import com.topcoder.servlet.request.*;
/**
 *
 * @author  rfairfax
 */
public class PlacementConfigInfo implements Serializable {
    
    private int userID;
    private String handle;
    private String name;
    
    public PlacementConfigInfo() {
        userID = 0;
        handle = "";
        name = "";
    }
    
    public void setHandle(String h) {
        handle = h;
    }
    
    public String getHandle() {
        return handle;
    }
    
    public void setName(String n) {
        name = n;
    }
    
    public String getName() {
        return name;
    }
    
    public void setUserID(int i) {
        userID = i;
    }
    
    public int getUserID() {
        return userID;
    }
}
