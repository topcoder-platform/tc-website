package com.topcoder.web.ejb.user;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface UserSchool extends EJBObject {

    public void createUserSchool(long _user_id, long _school_id)
            throws EJBException, RemoteException;

    public void removeUserSchool(long _user_id, long _school_id)
            throws EJBException, RemoteException;

    public void setCurrentUserSchoolId(long _user_id, long _school_id)
            throws EJBException, RemoteException;

    public long getCurrentUserSchoolId(long _user_id)
            throws EJBException, RemoteException;

    public boolean isCurrentUserSchoolId(long _user_id, long _school_id)
            throws EJBException, RemoteException;

    public boolean existsUserSchoolId(long _user_id, long _school_id)
            throws EJBException, RemoteException;

}

;
