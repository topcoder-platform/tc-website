/*
 * ContractingInfo.java
 *
 * Created on October 1, 2004, 11:51 AM
 */

package com.topcoder.web.tc.model;

import java.io.Serializable;
/**
 *
 * @author  rfairfax
 */
public class ContractingInfo implements Serializable {
    
    private long userID;
    
    /** Creates a new instance of ContractingInfo */
    public ContractingInfo() {
        userID = 0;
    }
    
    public void setUserID(long u) {
        userID = u;
    }
    
    public long getUserID() {
        return userID;
    }
    
}
