package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.SQLException;

public interface Sector extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer sector_id, String sector_desc) throws RemoteException, SQLException;

    public Integer create(String sector_desc) throws RemoteException, SQLException;

    public void delete(Integer sector_id) throws RemoteException, SQLException;

    public SectorObject request(int cmd, SectorObject obj) throws RemoteException, SQLException;

    public String findBySectorDesc(String sector_desc) throws RemoteException, SQLException;

    public void setSectorDesc(Integer sector_id, String sector_desc) throws RemoteException, SQLException;

    public String getSectorDesc(Integer sector_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
