package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface WebMenuHome extends javax.ejb.EJBHome {
    public WebMenu create() throws RemoteException, CreateException;
}
