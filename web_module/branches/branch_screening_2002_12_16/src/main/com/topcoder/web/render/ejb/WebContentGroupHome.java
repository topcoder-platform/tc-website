package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface WebContentGroupHome extends javax.ejb.EJBHome {
    public WebContentGroup create() throws RemoteException, CreateException;
}
