package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface LanguageHdrHome extends javax.ejb.EJBHome {
    public LanguageHdr create() throws RemoteException, CreateException;
}
