package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.SQLException;

public interface Access extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer access_id, String access_desc) throws RemoteException, SQLException;

    public void delete(Integer access_id) throws RemoteException, SQLException;

    public AccessObject request(int cmd, AccessObject obj) throws RemoteException, SQLException;

    public void setAccessDesc(Integer access_id, String access_desc) throws RemoteException, SQLException;

    public String getAccessDesc(Integer access_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
