package com.topcoder.web.ejb.user;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface User extends EJBObject {

    long createNewUser(String handle, char status, String dataSource)
            throws EJBException, RemoteException;

    void createUser(long userId, String _handle, char status, String dataSource)
            throws EJBException, RemoteException;


    void setFirstName(long userId, String firstName, String dataSource)
            throws EJBException, RemoteException;

    void setMiddleName(long userId, String middleName, String dataSource)
            throws EJBException, RemoteException;

    void setLastName(long userId, String lastName, String dataSource)
            throws EJBException, RemoteException;

    void setStatus(long userId, char status, String dataSource)
            throws EJBException, RemoteException;

    void setActivationCode(long userId, String code, String dataSource)
            throws EJBException, RemoteException;

    public String getHandle(long userId, String dataSource)
            throws EJBException, RemoteException;

    public void setHandle(long userId, String handle, String dataSource)
            throws EJBException, RemoteException;

    String getFirstName(long userId, String dataSource)
            throws EJBException, RemoteException;

    String getLastName(long userId, String dataSource) throws EJBException, RemoteException;

    String getMiddleName(long userId, String dataSource) throws EJBException, RemoteException;

    String getActivationCode(long userId, String dataSource) throws EJBException, RemoteException;

    char getStatus(long userId, String dataSource)
            throws EJBException, RemoteException;

    boolean userExists(long userId, String dataSource) throws RemoteException, EJBException;
}

