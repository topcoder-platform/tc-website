package com.topcoder.web.ejb.demographic;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface Response extends EJBObject {

    void createResponse(long userId, long questionId, String answerText, String dataSource) throws RemoteException, EJBException;

    void createResponse(long userId, long questionId, long answerId, String dataSource) throws RemoteException, EJBException;

    ResultSetContainer getResponses(long userId, String dataSource) throws RemoteException, EJBException;

    int remove(long userId, long questionId, String dataSource) throws RemoteException, EJBException;
}
