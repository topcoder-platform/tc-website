package com.topcoder.web.ejb.school;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface School extends EJBObject {

    long createSchool(String dataSource, String idDataSource) throws EJBException, RemoteException;

    String getSchoolDivisionCode(long schoolId, String dataSource)
            throws EJBException, RemoteException;

    String getFullName(long schoolId, String dataSource)
            throws EJBException, RemoteException;

    String getShortName(long schoolId, String dataSource)
            throws EJBException, RemoteException;

    void setSchoolDivisionCode(long schoolId,
                                      String schoolDivisionCode, String dataSource)
            throws EJBException, RemoteException;

    void setFullName(long schoolId, String fullName, String dataSource)
            throws EJBException, RemoteException;

    void setShortName(long schoolId, String shortName, String dataSource)
            throws EJBException, RemoteException;

    long createSchool(String dataSource, String idDataSource, String sortLetter, String city, String country, long userId, String name)
            throws EJBException, RemoteException;

    long getSchoolId(String name, String dataSource)
            throws EJBException, RemoteException;

    void setUserId(long schoolId, long userId, String dataSource) throws RemoteException;
}
