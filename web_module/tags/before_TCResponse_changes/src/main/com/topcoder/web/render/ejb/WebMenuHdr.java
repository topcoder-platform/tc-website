package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.Date;
import java.sql.SQLException;

public interface WebMenuHdr extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer menu_hdr_id, String country_code, String language_cd, Integer style_id, Integer menu_type_id, String menu_hdr_name, String menu_hdr_desc, Date created, Integer modify_by, Date modify_date) throws RemoteException, SQLException;

    public void delete(Integer menu_hdr_id) throws RemoteException, SQLException;

    public WebMenuHdrObject request(int cmd, WebMenuHdrObject obj) throws RemoteException, SQLException;

    public void setCountryCode(Integer menu_hdr_id, String country_code) throws RemoteException, SQLException;

    public String getCountryCode(Integer menu_hdr_id) throws RemoteException, SQLException;

    public void setLanguageCd(Integer menu_hdr_id, String language_cd) throws RemoteException, SQLException;

    public String getLanguageCd(Integer menu_hdr_id) throws RemoteException, SQLException;

    public void setStyleId(Integer menu_hdr_id, Integer style_id) throws RemoteException, SQLException;

    public Integer getStyleId(Integer menu_hdr_id) throws RemoteException, SQLException;

    public void setMenuTypeId(Integer menu_hdr_id, Integer menu_type_id) throws RemoteException, SQLException;

    public Integer getMenuTypeId(Integer menu_hdr_id) throws RemoteException, SQLException;

    public void setMenuHdrName(Integer menu_hdr_id, String menu_hdr_name) throws RemoteException, SQLException;

    public String getMenuHdrName(Integer menu_hdr_id) throws RemoteException, SQLException;

    public void setMenuHdrDesc(Integer menu_hdr_id, String menu_hdr_desc) throws RemoteException, SQLException;

    public String getMenuHdrDesc(Integer menu_hdr_id) throws RemoteException, SQLException;

    public void setCreated(Integer menu_hdr_id, Date created) throws RemoteException, SQLException;

    public Date getCreated(Integer menu_hdr_id) throws RemoteException, SQLException;

    public void setModifyBy(Integer menu_hdr_id, Integer modify_by) throws RemoteException, SQLException;

    public Integer getModifyBy(Integer menu_hdr_id) throws RemoteException, SQLException;

    public void setModifyDate(Integer menu_hdr_id, Date modify_date) throws RemoteException, SQLException;

    public Date getModifyDate(Integer menu_hdr_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
