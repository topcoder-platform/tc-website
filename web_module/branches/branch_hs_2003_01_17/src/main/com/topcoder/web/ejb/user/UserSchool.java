package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.EJBException;
import javax.ejb.EJBObject;

public interface UserSchool extends EJBObject {

    public void createUserSchool(long userId,long schoolId)
                                           throws EJBException, RemoteException;

    public void removeUserSchool(long userId,long schoolId)
                                           throws EJBException, RemoteException;

    public void setCurrentUserSchoolId(long userId,long schoolId)
                                           throws EJBException, RemoteException;

    public long getCurrentUserSchoolId(long userId)
                                           throws EJBException, RemoteException;

    public boolean isCurrentUserSchoolId(long userId,long schoolId)
                                           throws EJBException, RemoteException;

    public boolean existsUserSchoolId(long userId,long schoolId)
                                           throws EJBException, RemoteException;

};
