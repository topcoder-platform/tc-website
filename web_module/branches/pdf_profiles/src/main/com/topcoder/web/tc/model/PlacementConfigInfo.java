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
    
    
    public PlacementConfigInfo() {
        userID = 0;

    }
    
    public void setUserID(int i) {
        userID = i;
    }
    
    public int getUserID() {
        return userID;
    }
}
