package com.topcoder.web.query.ejb.QueryServices;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBObject;
import javax.ejb.EJBException;
import java.rmi.RemoteException;
import java.rmi.RemoteException;

/**
 *
 * @author   Greg Paul
 * @version  $Revision$
 */
public interface Command extends EJBObject {

    void createCommand(String commandDesc, int commandGroupId) throws RemoteException, EJBException;

    void setCommandDesc(long commandId, String commandDesc) throws RemoteException, EJBException;
    void setCommandGroupId(long commandId, int commandGroupId) throws RemoteException, EJBException;

    String getCommandDesc(long commandId) throws RemoteException, EJBException;
    int getCommandGroupId(long commandId) throws RemoteException, EJBException;

    void setDataSource(String dataSourceName) throws RemoteException, EJBException;

    ResultSetContainer getCommandList() throws RemoteException, EJBException;

}

