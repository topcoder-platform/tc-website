package com.topcoder.web.ejb.password;

import java.rmi.RemoteException;
import com.topcoder.security.*;

public interface PasswordRemote extends javax.ejb.EJBObject {

    public String encodePassword(String password) throws RemoteException, GeneralSecurityException;


}
