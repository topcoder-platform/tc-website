package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.Date;
import java.sql.SQLException;

public interface WebContent extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer content_id, Integer content_group_id, Object content, String content_name, Integer status_id, String language_cd, String country_code, Integer modify_by, Date modify_date) throws RemoteException, SQLException;

    public void delete(Integer content_id) throws RemoteException, SQLException;

    public WebContentObject request(int cmd, WebContentObject obj) throws RemoteException, SQLException;

    public String findByContentGroupId(Integer content_group_id) throws RemoteException, SQLException;

    public void setContentGroupId(Integer content_id, Integer content_group_id) throws RemoteException, SQLException;

    public Integer getContentGroupId(Integer content_id) throws RemoteException, SQLException;

    public String findByContent(Object content) throws RemoteException, SQLException;

    public void setContent(Integer content_id, Object content) throws RemoteException, SQLException;

    public Object getContent(Integer content_id) throws RemoteException, SQLException;

    public String findByContentName(String content_name) throws RemoteException, SQLException;

    public void setContentName(Integer content_id, String content_name) throws RemoteException, SQLException;

    public String getContentName(Integer content_id) throws RemoteException, SQLException;

    public void setStatusId(Integer content_id, Integer status_id) throws RemoteException, SQLException;

    public Integer getStatusId(Integer content_id) throws RemoteException, SQLException;

    public void setLanguageCd(Integer content_id, String language_cd) throws RemoteException, SQLException;

    public String getLanguageCd(Integer content_id) throws RemoteException, SQLException;

    public void setCountryCode(Integer content_id, String country_code) throws RemoteException, SQLException;

    public String getCountryCode(Integer content_id) throws RemoteException, SQLException;

    public void setModifyBy(Integer content_id, Integer modify_by) throws RemoteException, SQLException;

    public Integer getModifyBy(Integer content_id) throws RemoteException, SQLException;

    public void setModifyDate(Integer content_id, Date modify_date) throws RemoteException, SQLException;

    public Date getModifyDate(Integer content_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
