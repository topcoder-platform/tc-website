package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface UserHome extends javax.ejb.EJBHome {
    public User create() throws RemoteException, CreateException;
}
