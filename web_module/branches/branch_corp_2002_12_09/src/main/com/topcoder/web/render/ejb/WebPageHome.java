package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface WebPageHome extends javax.ejb.EJBHome {
    public WebPage create() throws RemoteException, CreateException;
}
