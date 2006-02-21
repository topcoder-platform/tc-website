package com.topcoder.web.ejb.email;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface Email extends EJBObject {

    long createEmail(long userId, String dataSource, String idDataSource) throws EJBException, RemoteException;

    void setPrimaryEmailId(long userId, long emailId, String dataSource)
            throws EJBException, RemoteException;

    long getPrimaryEmailId(long userId, String dataSource)
            throws EJBException, RemoteException;

    boolean exists(long userId, String dataSource) throws EJBException, RemoteException;

    void setEmailTypeId(long emailId, long emailTypeId, String dataSource)
            throws EJBException, RemoteException;

    long getEmailTypeId(long emailId, String dataSource)
            throws EJBException, RemoteException;

    void setAddress(long emailId, String address, String dataSource)
            throws EJBException, RemoteException;

    int getStatusId(long emailId, String dataSource) throws RemoteException;

    void setStatusId(long emailId, int statusId, String dataSource) throws RemoteException;

    String getAddress(long emailId, String dataSource) throws EJBException, RemoteException;

}
