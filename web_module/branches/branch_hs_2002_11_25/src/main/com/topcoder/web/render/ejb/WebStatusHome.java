package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface WebStatusHome extends javax.ejb.EJBHome {
    public WebStatus create() throws RemoteException, CreateException;
}
