package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface SectorAgreementHome extends javax.ejb.EJBHome {
    public SectorAgreement create() throws RemoteException, CreateException;
}
