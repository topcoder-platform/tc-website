package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.Date;
import java.sql.SQLException;

public interface WebPage extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer page_id, String language_cd, String page_name, Integer status_id, String page_title, String page_path, Integer sort_number, Integer site_hdr_id, String country_code, Integer modify_by, Date modify_date) throws RemoteException, SQLException;

    public void delete(Integer page_id) throws RemoteException, SQLException;

    public WebPageObject request(int cmd, WebPageObject obj) throws RemoteException, SQLException;

    public void setLanguageCd(Integer page_id, String language_cd) throws RemoteException, SQLException;

    public String getLanguageCd(Integer page_id) throws RemoteException, SQLException;

    public String findByPageName(String page_name) throws RemoteException, SQLException;

    public void setPageName(Integer page_id, String page_name) throws RemoteException, SQLException;

    public String getPageName(Integer page_id) throws RemoteException, SQLException;

    public void setStatusId(Integer page_id, Integer status_id) throws RemoteException, SQLException;

    public Integer getStatusId(Integer page_id) throws RemoteException, SQLException;

    public String findByPageTitle(String page_title) throws RemoteException, SQLException;

    public void setPageTitle(Integer page_id, String page_title) throws RemoteException, SQLException;

    public String getPageTitle(Integer page_id) throws RemoteException, SQLException;

    public void setPagePath(Integer page_id, String page_path) throws RemoteException, SQLException;

    public String getPagePath(Integer page_id) throws RemoteException, SQLException;

    public void setSortNumber(Integer page_id, Integer sort_number) throws RemoteException, SQLException;

    public Integer getSortNumber(Integer page_id) throws RemoteException, SQLException;

    public String findBySiteHdrId(Integer site_hdr_id) throws RemoteException, SQLException;

    public void setSiteHdrId(Integer page_id, Integer site_hdr_id) throws RemoteException, SQLException;

    public Integer getSiteHdrId(Integer page_id) throws RemoteException, SQLException;

    public void setCountryCode(Integer page_id, String country_code) throws RemoteException, SQLException;

    public String getCountryCode(Integer page_id) throws RemoteException, SQLException;

    public void setModifyBy(Integer page_id, Integer modify_by) throws RemoteException, SQLException;

    public Integer getModifyBy(Integer page_id) throws RemoteException, SQLException;

    public void setModifyDate(Integer page_id, Date modify_date) throws RemoteException, SQLException;

    public Date getModifyDate(Integer page_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
