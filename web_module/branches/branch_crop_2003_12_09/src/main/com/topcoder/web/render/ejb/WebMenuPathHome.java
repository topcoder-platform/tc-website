package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface WebMenuPathHome extends javax.ejb.EJBHome {
    public WebMenuPath create() throws RemoteException, CreateException;
}
