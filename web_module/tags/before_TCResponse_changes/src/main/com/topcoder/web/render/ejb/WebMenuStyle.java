package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.SQLException;

public interface WebMenuStyle extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer style_id, String style_desc, Object style_help, Object style_items) throws RemoteException, SQLException;

    public void delete(Integer style_id) throws RemoteException, SQLException;

    public WebMenuStyleObject request(int cmd, WebMenuStyleObject obj) throws RemoteException, SQLException;

    public void setStyleDesc(Integer style_id, String style_desc) throws RemoteException, SQLException;

    public String getStyleDesc(Integer style_id) throws RemoteException, SQLException;

    public void setStyleHelp(Integer style_id, Object style_help) throws RemoteException, SQLException;

    public Object getStyleHelp(Integer style_id) throws RemoteException, SQLException;

    public void setStyleItems(Integer style_id, Object style_items) throws RemoteException, SQLException;

    public Object getStyleItems(Integer style_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
