package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface SectorFileHome extends javax.ejb.EJBHome {
    public SectorFile create() throws RemoteException, CreateException;
}
