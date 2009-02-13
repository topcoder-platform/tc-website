package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.SQLException;

public interface WebMenu extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer menu_id, String menu_name, Object menu_content, String menu_isenabled) throws RemoteException, SQLException;

    public void delete(Integer menu_id) throws RemoteException, SQLException;

    public WebMenuObject request(int cmd, WebMenuObject obj) throws RemoteException, SQLException;

    public void setMenuName(Integer menu_id, String menu_name) throws RemoteException, SQLException;

    public String getMenuName(Integer menu_id) throws RemoteException, SQLException;

    public void setMenuContent(Integer menu_id, Object menu_content) throws RemoteException, SQLException;

    public Object getMenuContent(Integer menu_id) throws RemoteException, SQLException;

    public void setMenuIsenabled(Integer menu_id, String menu_isenabled) throws RemoteException, SQLException;

    public String getMenuIsenabled(Integer menu_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
