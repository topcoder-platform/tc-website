package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.SQLException;

public interface GroupUser extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer group_id, Integer user_id) throws RemoteException, SQLException;

    public void delete(Integer group_id) throws RemoteException, SQLException;

    public GroupUserObject request(int cmd, GroupUserObject obj) throws RemoteException, SQLException;

    public String findByUserId(Integer user_id) throws RemoteException, SQLException;

    public void setUserId(Integer group_id, Integer user_id) throws RemoteException, SQLException;

    public Integer getUserId(Integer group_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
