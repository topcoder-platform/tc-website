package com.topcoder.web.render.ejb;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface WebCountryLanguageHome extends javax.ejb.EJBHome {
    public WebCountryLanguage create() throws RemoteException, CreateException;
}
