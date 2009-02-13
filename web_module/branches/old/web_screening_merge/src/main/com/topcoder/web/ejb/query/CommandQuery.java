package com.topcoder.web.ejb.query;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 *
 * @author   Greg Paul
 * @version  $Revision$
 */
public interface CommandQuery extends EJBObject {

    void createCommandQuery(long commandId, long queryId, String dataSourceName) throws RemoteException, EJBException;

    void setSortOrder(long commandId, long queryId, int sortOrder, String dataSourceName) throws RemoteException, EJBException;

    int getSortOrder(long commandId, long queryId, String dataSourceName) throws RemoteException, EJBException;

    void removeCommandQuery(long commandId, long queryId, String dataSourceName) throws RemoteException, EJBException;

    ResultSetContainer getQueriesForCommand(long commandId, String dataSourceName) throws RemoteException, EJBException;
    ResultSetContainer getCommandsForQuery(long queryId, String dataSourceName) throws RemoteException, EJBException;
}

