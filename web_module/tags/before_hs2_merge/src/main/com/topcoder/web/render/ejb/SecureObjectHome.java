package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface SecureObjectHome extends javax.ejb.EJBHome {
    public SecureObject create() throws RemoteException, CreateException;
}
