package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface WebMenuHdrHome extends javax.ejb.EJBHome {
    public WebMenuHdr create() throws RemoteException, CreateException;
}
