package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.Date;
import java.sql.SQLException;

public interface WebFile extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer file_id, String file_desc, Integer image_height, Integer image_width, Integer modify_by, Date modify_date) throws RemoteException, SQLException;

    public void delete(Integer file_id) throws RemoteException, SQLException;

    public WebFileObject request(int cmd, WebFileObject obj) throws RemoteException, SQLException;

    public void setFileDesc(Integer file_id, String file_desc) throws RemoteException, SQLException;

    public String getFileDesc(Integer file_id) throws RemoteException, SQLException;

    public void setImageHeight(Integer file_id, Integer image_height) throws RemoteException, SQLException;

    public Integer getImageHeight(Integer file_id) throws RemoteException, SQLException;

    public void setImageWidth(Integer file_id, Integer image_width) throws RemoteException, SQLException;

    public Integer getImageWidth(Integer file_id) throws RemoteException, SQLException;

    public void setModifyBy(Integer file_id, Integer modify_by) throws RemoteException, SQLException;

    public Integer getModifyBy(Integer file_id) throws RemoteException, SQLException;

    public void setModifyDate(Integer file_id, Date modify_date) throws RemoteException, SQLException;

    public Date getModifyDate(Integer file_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
