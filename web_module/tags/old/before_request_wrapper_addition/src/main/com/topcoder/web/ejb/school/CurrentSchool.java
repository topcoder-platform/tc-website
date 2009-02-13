package com.topcoder.web.ejb.school;

import javax.ejb.EJBObject;
import javax.ejb.EJBException;
import java.rmi.RemoteException;

public interface CurrentSchool extends EJBObject {

    void createCurrentSchool(long coderId, String dataSource)
            throws EJBException, RemoteException;

    void setSchoolName(long coderId, String schoolName, String dataSource) throws EJBException, RemoteException;

    void setSchoolId(long coderId, long schoolId, String dataSource) throws EJBException, RemoteException;

    boolean exists(long coderId, String dataSource) throws EJBException, RemoteException;

}
