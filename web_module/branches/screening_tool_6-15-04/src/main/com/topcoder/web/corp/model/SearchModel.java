/*
 * SearchModel.java
 *
 * Created on July 13, 2004, 11:31 AM
 */

package com.topcoder.web.corp.model;

/**
 *
 * @author  rfairfax
 */
public class SearchModel extends BaseModel {
    
    private String firstName;
    private String lastName;
    private String emailAddress;
    
    /** Creates a new instance of SearchModel */
    public SearchModel() {
        firstName = "";
        lastName = "";
        emailAddress = "";
    }
    
    public void setFirstName(String s) {
        firstName = s;
    }
    
    public void setLastName(String s) {
        lastName = s;
    }
    
    public void setEmailAddress(String s) {
        emailAddress = s;
    }
    
    public String getFirstName() {
        return firstName;
    }
    
    public String getLastName() {
        return lastName;
    }
    
    public String getEmailAddress() {
        return emailAddress;
    }
    
}
