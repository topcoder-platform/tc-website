package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.Date;
import java.sql.SQLException;

public interface WebSiteHdr extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer site_hdr_id, String site_hdr_name, String site_hdr_desc, Date created, Date modify_date, Integer modify_by) throws RemoteException, SQLException;

    public void delete(Integer site_hdr_id) throws RemoteException, SQLException;

    public WebSiteHdrObject request(int cmd, WebSiteHdrObject obj) throws RemoteException, SQLException;

    public String list() throws RemoteException, SQLException;

    public void setSiteHdrName(Integer site_hdr_id, String site_hdr_name) throws RemoteException, SQLException;

    public String getSiteHdrName(Integer site_hdr_id) throws RemoteException, SQLException;

    public String findBySiteHdrDesc(String site_hdr_desc) throws RemoteException, SQLException;

    public void setSiteHdrDesc(Integer site_hdr_id, String site_hdr_desc) throws RemoteException, SQLException;

    public String getSiteHdrDesc(Integer site_hdr_id) throws RemoteException, SQLException;

    public void setCreated(Integer site_hdr_id, Date created) throws RemoteException, SQLException;

    public Date getCreated(Integer site_hdr_id) throws RemoteException, SQLException;

    public void setModifyDate(Integer site_hdr_id, Date modify_date) throws RemoteException, SQLException;

    public Date getModifyDate(Integer site_hdr_id) throws RemoteException, SQLException;

    public void setModifyBy(Integer site_hdr_id, Integer modify_by) throws RemoteException, SQLException;

    public Integer getModifyBy(Integer site_hdr_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
