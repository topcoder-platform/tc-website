package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.SQLException;

public interface Permission extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer secure_object_id, Integer sector_id, Integer access_id) throws RemoteException, SQLException;

    public void delete(Integer secure_object_id, Integer sector_id) throws RemoteException, SQLException;

    public PermissionObject request(int cmd, PermissionObject obj) throws RemoteException, SQLException;

    public void setAccessId(Integer secure_object_id, Integer sector_id, Integer access_id) throws RemoteException, SQLException;

    public Integer getAccessId(Integer secure_object_id, Integer sector_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
