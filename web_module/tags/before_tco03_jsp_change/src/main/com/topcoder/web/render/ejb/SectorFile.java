package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.Date;
import java.sql.SQLException;

public interface SectorFile extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer sector_id, String file, String system, String status, String language_cd, String path, String link, String country_code, Integer modify_by, Date modify_date) throws RemoteException, SQLException;

    public void delete(Integer sector_id) throws RemoteException, SQLException;

    public SectorFileObject request(int cmd, SectorFileObject obj) throws RemoteException, SQLException;

    public String list() throws RemoteException, SQLException;

    public String findByFile(String file) throws RemoteException, SQLException;

    public void setFile(Integer sector_id, String file) throws RemoteException, SQLException;

    public String getFile(Integer sector_id) throws RemoteException, SQLException;

    public void setSystem(Integer sector_id, String system) throws RemoteException, SQLException;

    public String getSystem(Integer sector_id) throws RemoteException, SQLException;

    public void setStatus(Integer sector_id, String status) throws RemoteException, SQLException;

    public String getStatus(Integer sector_id) throws RemoteException, SQLException;

    public void setLanguageCd(Integer sector_id, String language_cd) throws RemoteException, SQLException;

    public String getLanguageCd(Integer sector_id) throws RemoteException, SQLException;

    public void setPath(Integer sector_id, String path) throws RemoteException, SQLException;

    public String getPath(Integer sector_id) throws RemoteException, SQLException;

    public String findByLink(String link) throws RemoteException, SQLException;

    public void setLink(Integer sector_id, String link) throws RemoteException, SQLException;

    public String getLink(Integer sector_id) throws RemoteException, SQLException;

    public void setCountryCode(Integer sector_id, String country_code) throws RemoteException, SQLException;

    public String getCountryCode(Integer sector_id) throws RemoteException, SQLException;

    public void setModifyBy(Integer sector_id, Integer modify_by) throws RemoteException, SQLException;

    public Integer getModifyBy(Integer sector_id) throws RemoteException, SQLException;

    public void setModifyDate(Integer sector_id, Date modify_date) throws RemoteException, SQLException;

    public Date getModifyDate(Integer sector_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
