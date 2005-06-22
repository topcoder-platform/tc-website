package com.topcoder.security.login;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;

public interface LoginLocal extends javax.ejb.EJBLocalObject {

    public TCSubject login(String username, String password)
            throws GeneralSecurityException;

}
