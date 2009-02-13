package com.topcoder.web.ejb.user;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface User extends EJBObject {

    public void createUser(long userId, String _handle, char _status)
            throws EJBException, RemoteException;


    public void setFirstName(long userId, String _first_name)
            throws EJBException, RemoteException;

    public void setLastName(long userId, String _last_name)
            throws EJBException, RemoteException;

    public void setStatus(long userId, char status)
            throws EJBException, RemoteException;

    public String getFirstName(long userId)
            throws EJBException, RemoteException;

    public String getLastName(long userId) throws EJBException, RemoteException;

    public char getStatus(long userId)
            throws EJBException, RemoteException;

    public boolean userExists(long userId) throws RemoteException, EJBException;
}

;
