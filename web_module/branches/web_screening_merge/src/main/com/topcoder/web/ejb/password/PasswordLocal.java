package com.topcoder.web.ejb.password;

import com.topcoder.security.GeneralSecurityException;

public interface PasswordLocal extends javax.ejb.EJBLocalObject {

    public String encodePassword(String password) throws GeneralSecurityException;
}
