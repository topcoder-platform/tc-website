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
public interface CommandQuery extends EJBObject {

    void createCommandQuery(long commandId, long queryId) throws RemoteException, EJBException;

    void setSortOrder(long commandId, long queryId, int sortOrder) throws RemoteException, EJBException;

    int getSortOrder(long commandId, long queryId) throws RemoteException, EJBException;

    void removeCommandQuery(long commandId, long queryId) throws RemoteException, EJBException;

    void setDataSource(String dataSourceName) throws RemoteException, EJBException;

    ResultSetContainer getQueriesForCommand(long commandId) throws RemoteException, EJBException;
}

