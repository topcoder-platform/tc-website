package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface CountryHome extends javax.ejb.EJBHome {
    public Country create() throws RemoteException, CreateException;
}
