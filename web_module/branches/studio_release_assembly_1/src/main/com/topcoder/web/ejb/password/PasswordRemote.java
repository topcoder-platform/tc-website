package com.topcoder.web.ejb.password;

import com.topcoder.security.GeneralSecurityException;

import java.rmi.RemoteException;

public interface PasswordRemote extends javax.ejb.EJBObject {

    public String encodePassword(String password) throws RemoteException, GeneralSecurityException;


}
