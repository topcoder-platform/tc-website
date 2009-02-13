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
public interface QueryInput extends EJBObject {

    void createQueryInput(long queryId, long inputId) throws RemoteException, EJBException;

    void setOptional(long queryId, long inputId, char optional) throws RemoteException, EJBException;
    void setDefaultValue(long queryId, long inputId, String defaultValue) throws RemoteException, EJBException;
    void setSortOrder(long queryId, long inputId, int sortOrder) throws RemoteException, EJBException;

    char getOptional(long queryId, long inputId) throws RemoteException, EJBException;
    String getDefaultValue(long queryId, long inputId) throws RemoteException, EJBException;
    int getSortOrder(long queryId, long inputId) throws RemoteException, EJBException;

    void removeQueryInput(long queryId, long inputId) throws RemoteException, EJBException;

    void setDataSource(String dataSourceName) throws RemoteException, EJBException;

    ResultSetContainer getInputsForCommand(long commandId) throws RemoteException, EJBException;
    ResultSetContainer getInputsForQuery(long queryId) throws RemoteException, EJBException;
}

