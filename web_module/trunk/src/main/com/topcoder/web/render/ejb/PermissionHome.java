package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface PermissionHome extends javax.ejb.EJBHome {
    public Permission create() throws RemoteException, CreateException;
}
