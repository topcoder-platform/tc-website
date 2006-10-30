package com.topcoder.web.ejb.user;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface UserSchool extends EJBObject {

    public void createUserSchool(long userId, long schoolId, String dataSource)
            throws EJBException, RemoteException;

    public void removeUserSchool(long userId, long schoolId, String dataSource)
            throws EJBException, RemoteException;

    public void setCurrentUserSchoolId(long userId, long schoolId, String dataSource)
            throws EJBException, RemoteException;

    public long getCurrentUserSchoolId(long userId, String dataSource)
            throws EJBException, RemoteException;

    public boolean isCurrentUserSchoolId(long userId, long schoolId, String dataSource)
            throws EJBException, RemoteException;

    public boolean exists(long userId, long schoolId, String dataSource)
            throws EJBException, RemoteException;

}

;
