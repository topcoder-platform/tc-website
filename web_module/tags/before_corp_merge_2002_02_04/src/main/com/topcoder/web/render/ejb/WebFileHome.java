package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface WebFileHome extends javax.ejb.EJBHome {
    public WebFile create() throws RemoteException, CreateException;
}
