package com.topcoder.web.ejb.school;

import java.rmi.RemoteException;
import javax.ejb.EJBException;
import javax.ejb.EJBObject;

public interface School extends EJBObject {

  public long createSchool() throws EJBException, RemoteException;

    public String getSchoolDivisionCode(long schoolId)
                                           throws EJBException, RemoteException;

    public String getFullName(long schoolId)
                                           throws EJBException, RemoteException;

    public String getShortName(long schoolId)
                                           throws EJBException, RemoteException;

    public void setSchoolDivisionCode(long schoolId,
                                    String schoolDivisionCode)
                                           throws EJBException, RemoteException;

    public void setFullName(long schoolId, String fullName)
                                           throws EJBException, RemoteException;

    public void setShortName(long schoolId, String shortName)
                                           throws EJBException, RemoteException;

};
