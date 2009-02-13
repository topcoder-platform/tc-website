package com.topcoder.web.ejb.school;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface School extends EJBObject {

    public long createSchool() throws EJBException, RemoteException;

    public String getSchoolDivisionCode(long schoolId)
            throws EJBException, RemoteException;

    public String getFullName(long schoolId)
            throws EJBException, RemoteException;

    public String getShortName(long schoolId)
            throws EJBException, RemoteException;

    public void setSchoolDivisionCode(long schoolId,
                                      String _school_division_code)
            throws EJBException, RemoteException;

    public void setFullName(long schoolId, String _full_name)
            throws EJBException, RemoteException;

    public void setShortName(long schoolId, String _short_name)
            throws EJBException, RemoteException;

}

;
