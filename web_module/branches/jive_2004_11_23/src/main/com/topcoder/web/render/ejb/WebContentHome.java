package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface WebContentHome extends javax.ejb.EJBHome {
    public WebContent create() throws RemoteException, CreateException;
}
