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
public interface QueryInput extends EJBObject {

    void createQueryInput(long queryId, long inputId, String dataSourceName) throws RemoteException, EJBException;

    void setOptional(long queryId, long inputId, char optional, String dataSourceName) throws RemoteException, EJBException;

    void setDefaultValue(long queryId, long inputId, String defaultValue, String dataSourceName) throws RemoteException, EJBException;

    void setSortOrder(long queryId, long inputId, int sortOrder, String dataSourceName) throws RemoteException, EJBException;

    char getOptional(long queryId, long inputId, String dataSourceName) throws RemoteException, EJBException;

    String getDefaultValue(long queryId, long inputId, String dataSourceName) throws RemoteException, EJBException;

    int getSortOrder(long queryId, long inputId, String dataSourceName) throws RemoteException, EJBException;

    void removeQueryInput(long queryId, long inputId, String dataSourceName) throws RemoteException, EJBException;

    ResultSetContainer getInputsForCommand(long commandId, String dataSourceName) throws RemoteException, EJBException;

    ResultSetContainer getInputsForQuery(long queryId, String dataSourceName) throws RemoteException, EJBException;
}

