package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.Date;
import java.sql.SQLException;

public interface WebMenuPath extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer menu_hdr_id, Integer menu_id, Integer parent_id, Integer menu_order, Integer modify_by, Date modify_date) throws RemoteException, SQLException;

    public void delete(Integer menu_hdr_id) throws RemoteException, SQLException;

    public WebMenuPathObject request(int cmd, WebMenuPathObject obj) throws RemoteException, SQLException;

    public void setMenuId(Integer menu_hdr_id, Integer menu_id) throws RemoteException, SQLException;

    public Integer getMenuId(Integer menu_hdr_id) throws RemoteException, SQLException;

    public void setParentId(Integer menu_hdr_id, Integer parent_id) throws RemoteException, SQLException;

    public Integer getParentId(Integer menu_hdr_id) throws RemoteException, SQLException;

    public void setMenuOrder(Integer menu_hdr_id, Integer menu_order) throws RemoteException, SQLException;

    public Integer getMenuOrder(Integer menu_hdr_id) throws RemoteException, SQLException;

    public void setModifyBy(Integer menu_hdr_id, Integer modify_by) throws RemoteException, SQLException;

    public Integer getModifyBy(Integer menu_hdr_id) throws RemoteException, SQLException;

    public void setModifyDate(Integer menu_hdr_id, Date modify_date) throws RemoteException, SQLException;

    public Date getModifyDate(Integer menu_hdr_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
