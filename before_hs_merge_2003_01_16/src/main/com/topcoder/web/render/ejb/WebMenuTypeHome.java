package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface WebMenuTypeHome extends javax.ejb.EJBHome {
    public WebMenuType create() throws RemoteException, CreateException;
}
