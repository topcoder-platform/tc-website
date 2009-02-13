package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.Date;
import java.sql.SQLException;

public interface WebPagePath extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer site_hdr_id, Integer page_id, Integer parent_id, Integer page_order, Integer modify_by, Date modify_date) throws RemoteException, SQLException;

    public void delete(Integer site_hdr_id) throws RemoteException, SQLException;

    public WebPagePathObject request(int cmd, WebPagePathObject obj) throws RemoteException, SQLException;

    public String findByPageId(Integer page_id) throws RemoteException, SQLException;

    public void setPageId(Integer site_hdr_id, Integer page_id) throws RemoteException, SQLException;

    public Integer getPageId(Integer site_hdr_id) throws RemoteException, SQLException;

    public void setParentId(Integer site_hdr_id, Integer parent_id) throws RemoteException, SQLException;

    public Integer getParentId(Integer site_hdr_id) throws RemoteException, SQLException;

    public void setPageOrder(Integer site_hdr_id, Integer page_order) throws RemoteException, SQLException;

    public Integer getPageOrder(Integer site_hdr_id) throws RemoteException, SQLException;

    public void setModifyBy(Integer site_hdr_id, Integer modify_by) throws RemoteException, SQLException;

    public Integer getModifyBy(Integer site_hdr_id) throws RemoteException, SQLException;

    public void setModifyDate(Integer site_hdr_id, Date modify_date) throws RemoteException, SQLException;

    public Date getModifyDate(Integer site_hdr_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
