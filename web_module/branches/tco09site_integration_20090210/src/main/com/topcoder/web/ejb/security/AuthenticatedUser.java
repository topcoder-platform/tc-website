package com.topcoder.web.ejb.security;

import java.io.Serializable;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 21, 2008
 */
public class AuthenticatedUser implements Serializable {

    //@XmlElement(namespace="", name="userName")
    private String userName;

    //@XmlElement(namespace="", name="userId")
    private Long userId;

    private static final long serialVersionUID = -4504131195466365739L;


    public AuthenticatedUser() {
    }

    AuthenticatedUser(Long userId, String userName) {
        this.userId = userId;
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
