package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface CoderHome extends javax.ejb.EJBHome {
    public Coder create() throws RemoteException, CreateException;
}
