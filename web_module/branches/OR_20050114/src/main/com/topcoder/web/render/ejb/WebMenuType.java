package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.Date;
import java.sql.SQLException;

public interface WebMenuType extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer menu_type_id, String menu_type_desc, Integer modify_by, Date modify_date) throws RemoteException, SQLException;

    public void delete(Integer menu_type_id) throws RemoteException, SQLException;

    public WebMenuTypeObject request(int cmd, WebMenuTypeObject obj) throws RemoteException, SQLException;

    public void setMenuTypeDesc(Integer menu_type_id, String menu_type_desc) throws RemoteException, SQLException;

    public String getMenuTypeDesc(Integer menu_type_id) throws RemoteException, SQLException;

    public void setModifyBy(Integer menu_type_id, Integer modify_by) throws RemoteException, SQLException;

    public Integer getModifyBy(Integer menu_type_id) throws RemoteException, SQLException;

    public void setModifyDate(Integer menu_type_id, Date modify_date) throws RemoteException, SQLException;

    public Date getModifyDate(Integer menu_type_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
