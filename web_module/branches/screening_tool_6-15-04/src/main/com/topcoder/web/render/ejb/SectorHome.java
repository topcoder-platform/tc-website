package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface SectorHome extends javax.ejb.EJBHome {
    public Sector create() throws RemoteException, CreateException;
}
