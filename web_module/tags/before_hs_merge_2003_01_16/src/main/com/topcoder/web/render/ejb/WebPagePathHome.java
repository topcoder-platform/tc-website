package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface WebPagePathHome extends javax.ejb.EJBHome {
    public WebPagePath create() throws RemoteException, CreateException;
}
