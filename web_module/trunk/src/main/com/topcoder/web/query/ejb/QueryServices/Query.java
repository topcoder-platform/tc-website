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
public interface Query extends EJBObject {

    void createQuery(String text, String name, int ranking, int column_index) throws RemoteException, EJBException;

    void setText(long queryId, String text) throws RemoteException, EJBException;
    void setName(long queryId, String name) throws RemoteException, EJBException;
    void setRanking(long queryId, int ranking) throws RemoteException, EJBException;
    void setColumnIndex(long queryId, int columnIndex) throws RemoteException, EJBException;

    String getText(long queryId) throws RemoteException, EJBException;
    String getName(long queryId) throws RemoteException, EJBException;
    int getRanking(long queryId) throws RemoteException, EJBException;
    int getColumnIndex(long queryId) throws RemoteException, EJBException;
    ResultSetContainer getAllQueries(boolean includeText) throws RemoteException, EJBException;

    void setDataSource(String dataSourceName) throws RemoteException, EJBException;

}

