package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface GroupUserHome extends javax.ejb.EJBHome {
    public GroupUser create() throws RemoteException, CreateException;
}
