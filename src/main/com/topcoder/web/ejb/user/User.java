package com.topcoder.web.ejb.user;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface User extends EJBObject {

    public void createUser(long _user_id, String _handle, char _status)
            throws EJBException, RemoteException;


    public void setFirstName(long _user_id, String _first_name)
            throws EJBException, RemoteException;

    public void setLastName(long _user_id, String _last_name)
            throws EJBException, RemoteException;

    public void setUserStatusId(long _user_id, long _user_status_id)
            throws EJBException, RemoteException;

    public String getFirstName(long _user_id)
            throws EJBException, RemoteException;

    public String getLastName(long _user_id) throws EJBException, RemoteException;

    public long getUserStatusId(long _user_id)
            throws EJBException, RemoteException;

}

;
