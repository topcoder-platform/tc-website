package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.SQLException;

public interface Country extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(String country_code, String country_name) throws RemoteException, SQLException;

    public void delete(String country_code) throws RemoteException, SQLException;

    public CountryObject request(int cmd, CountryObject obj) throws RemoteException, SQLException;

    public String findByCountryName(String country_name) throws RemoteException, SQLException;

    public void setCountryName(String country_code, String country_name) throws RemoteException, SQLException;

    public String getCountryName(String country_code) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
