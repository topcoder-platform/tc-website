package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.SQLException;

public interface WebCountryLanguage extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(String language_cd, String country_code) throws RemoteException, SQLException;

    public void delete(String language_cd, String country_code) throws RemoteException, SQLException;

    public WebCountryLanguageObject request(int cmd, WebCountryLanguageObject obj) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
