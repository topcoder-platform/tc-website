package com.topcoder.web.ejb.school;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface School extends EJBObject {

    public long createSchool() throws EJBException, RemoteException;

    public String getSchoolDivisionCode(long _school_id)
            throws EJBException, RemoteException;

    public String getFullName(long _school_id)
            throws EJBException, RemoteException;

    public String getShortName(long _school_id)
            throws EJBException, RemoteException;

    public void setSchoolDivisionCode(long _school_id,
                                      String _school_division_code)
            throws EJBException, RemoteException;

    public void setFullName(long _school_id, String _full_name)
            throws EJBException, RemoteException;

    public void setShortName(long _school_id, String _short_name)
            throws EJBException, RemoteException;

}

;
