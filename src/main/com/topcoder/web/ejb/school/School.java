package com.topcoder.web.ejb.school;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface School extends EJBObject {

    public long createSchool(String dataSource, String idDataSource) throws EJBException, RemoteException;

    public String getSchoolDivisionCode(long schoolId, String dataSource)
            throws EJBException, RemoteException;

    public String getFullName(long schoolId, String dataSource)
            throws EJBException, RemoteException;

    public String getShortName(long schoolId, String dataSource)
            throws EJBException, RemoteException;

    public void setSchoolDivisionCode(long schoolId,
                                      String schoolDivisionCode, String dataSource)
            throws EJBException, RemoteException;

    public void setFullName(long schoolId, String fullName, String dataSource)
            throws EJBException, RemoteException;

    public void setShortName(long schoolId, String shortName, String dataSource)
            throws EJBException, RemoteException;

}
