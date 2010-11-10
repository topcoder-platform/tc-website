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
public interface Query extends EJBObject {

    long createQuery(String text, String name, int ranking, String dataSourceName) throws RemoteException, EJBException;

    void setText(long queryId, String text, String dataSourceName) throws RemoteException, EJBException;

    void setName(long queryId, String name, String dataSourceName) throws RemoteException, EJBException;

    void setRanking(long queryId, int ranking, String dataSourceName) throws RemoteException, EJBException;

    void setColumnIndex(long queryId, int columnIndex, String dataSourceName) throws RemoteException, EJBException;

    String getText(long queryId, String dataSourceName) throws RemoteException, EJBException;

    String getName(long queryId, String dataSourceName) throws RemoteException, EJBException;

    int getRanking(long queryId, String dataSourceName) throws RemoteException, EJBException;

    int getColumnIndex(long queryId, String dataSourceName) throws RemoteException, EJBException;

    ResultSetContainer getAllQueries(boolean includeText, String dataSourceName) throws RemoteException, EJBException;

}

