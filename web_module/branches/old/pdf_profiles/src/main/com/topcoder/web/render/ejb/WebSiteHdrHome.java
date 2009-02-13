package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface WebSiteHdrHome extends javax.ejb.EJBHome {
    public WebSiteHdr create() throws RemoteException, CreateException;
}
