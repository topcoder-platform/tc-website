/*
 * SSOInfo
 * 
 * Created Dec 22, 2008
 */
package com.topcoder.web.ejb.security;

import java.io.Serializable;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
public class SSOInfo implements Serializable {
    private String userName;
    private String password;
    private String updatedSSOToken;
    private String updatedRememberToken;
    
    public SSOInfo() {
    }

    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getUserName() {
        return userName;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getPassword() {
        return password;
    }
    public void setUpdatedSSOToken(String updatedSSOToken) {
        this.updatedSSOToken = updatedSSOToken;
    }
    public String getUpdatedSSOToken() {
        return updatedSSOToken;
    }
    public void setUpdatedRememberToken(String updatedRememberToken) {
        this.updatedRememberToken = updatedRememberToken;
    }
    public String getUpdatedRememberToken() {
        return updatedRememberToken;
    }
}
