package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.Date;
import java.sql.SQLException;

public interface SectorAgreement extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer sector_id, Integer user_id, Date agree_date) throws RemoteException, SQLException;

    public void delete(Integer sector_id) throws RemoteException, SQLException;

    public SectorAgreementObject request(int cmd, SectorAgreementObject obj) throws RemoteException, SQLException;

    public String list() throws RemoteException, SQLException;

    public String findByUserId(Integer user_id) throws RemoteException, SQLException;

    public void setUserId(Integer sector_id, Integer user_id) throws RemoteException, SQLException;

    public Integer getUserId(Integer sector_id) throws RemoteException, SQLException;

    public void setAgreeDate(Integer sector_id, Date agree_date) throws RemoteException, SQLException;

    public Date getAgreeDate(Integer sector_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
