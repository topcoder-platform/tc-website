package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface WebMenuStyleHome extends javax.ejb.EJBHome {
    public WebMenuStyle create() throws RemoteException, CreateException;
}
