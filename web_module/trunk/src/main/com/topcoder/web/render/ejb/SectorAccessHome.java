package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface SectorAccessHome extends javax.ejb.EJBHome {
    public SectorAccess create() throws RemoteException, CreateException;
}
