package com.topcoder.web.query.ejb.QueryServices;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 *
 * @author   Greg Paul
 * @version  $Revision$
 */
public interface Command extends EJBObject {

    long createCommand(String commandDesc, int commandGroupId, String dataSourceName) throws RemoteException, EJBException;

    void setCommandDesc(long commandId, String commandDesc, String dataSourceName) throws RemoteException, EJBException;
    void setCommandGroupId(long commandId, int commandGroupId, String dataSourceName) throws RemoteException, EJBException;

    String getCommandDesc(long commandId, String dataSourceName) throws RemoteException, EJBException;
    int getCommandGroupId(long commandId, String dataSourceName) throws RemoteException, EJBException;

    ResultSetContainer getCommandList(String dataSourceName) throws RemoteException, EJBException;

}

