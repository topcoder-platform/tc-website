package com.topcoder.web.render.ejb;

import java.rmi.RemoteException;
import java.sql.Date;
import java.sql.SQLException;

public interface User extends javax.ejb.EJBObject {
    public static final int INSERT = 1;
    public static final int SELECT = 2;
    public static final int UPDATE = 3;
    public static final int DELETE = 4;

    public void create(Integer user_id, String handle, String password, String status, Integer user_type_id, String email, String logged_in, String terms, Date last_login, Integer path_id) throws RemoteException, SQLException;

    public void delete(Integer user_id) throws RemoteException, SQLException;

    public UserObject request(int cmd, UserObject obj) throws RemoteException, SQLException;

    public String findByHandle(String handle) throws RemoteException, SQLException;

    public void setHandle(Integer user_id, String handle) throws RemoteException, SQLException;

    public String getHandle(Integer user_id) throws RemoteException, SQLException;

    public String findByPassword(String password) throws RemoteException, SQLException;

    public void setPassword(Integer user_id, String password) throws RemoteException, SQLException;

    public String getPassword(Integer user_id) throws RemoteException, SQLException;

    public String findByStatus(String status) throws RemoteException, SQLException;

    public void setStatus(Integer user_id, String status) throws RemoteException, SQLException;

    public String getStatus(Integer user_id) throws RemoteException, SQLException;

    public void setUserTypeId(Integer user_id, Integer user_type_id) throws RemoteException, SQLException;

    public Integer getUserTypeId(Integer user_id) throws RemoteException, SQLException;

    public void setEmail(Integer user_id, String email) throws RemoteException, SQLException;

    public String getEmail(Integer user_id) throws RemoteException, SQLException;

    public String findByLoggedIn(String logged_in) throws RemoteException, SQLException;

    public void setLoggedIn(Integer user_id, String logged_in) throws RemoteException, SQLException;

    public String getLoggedIn(Integer user_id) throws RemoteException, SQLException;

    public String findByTerms(String terms) throws RemoteException, SQLException;

    public void setTerms(Integer user_id, String terms) throws RemoteException, SQLException;

    public String getTerms(Integer user_id) throws RemoteException, SQLException;

    public void setLastLogin(Integer user_id, Date last_login) throws RemoteException, SQLException;

    public Date getLastLogin(Integer user_id) throws RemoteException, SQLException;

    public void setPathId(Integer user_id, Integer path_id) throws RemoteException, SQLException;

    public Integer getPathId(Integer user_id) throws RemoteException, SQLException;

    public void clearCache() throws RemoteException;
}
