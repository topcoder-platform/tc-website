package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.SQLException;

public interface LanguageHdr extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(String language_cd, String language_decode, String language_desc) throws RemoteException, SQLException;

    public void delete(String language_cd) throws RemoteException, SQLException;

    public LanguageHdrObject request(int cmd, LanguageHdrObject obj) throws RemoteException, SQLException;

    public void setLanguageDecode(String language_cd, String language_decode) throws RemoteException, SQLException;

    public String getLanguageDecode(String language_cd) throws RemoteException, SQLException;

    public void setLanguageDesc(String language_cd, String language_desc) throws RemoteException, SQLException;

    public String getLanguageDesc(String language_cd) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
