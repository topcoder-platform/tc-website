package com.topcoder.security.login;

import java.rmi.RemoteException;
import javax.ejb.FinderException;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;

public interface LoginRemote extends  javax.ejb.EJBObject {

    public TCSubject login(String username, String password) 
        throws RemoteException, GeneralSecurityException;

}
