package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface GroupHome extends javax.ejb.EJBHome {
    public Group create() throws RemoteException, CreateException;
}
