package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface AccessHome extends javax.ejb.EJBHome {
    public Access create() throws RemoteException, CreateException;
}
