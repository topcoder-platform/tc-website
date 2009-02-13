package com.topcoder.web.ejb.demographic;

import javax.ejb.EJBObject;
import javax.ejb.EJBException;
import java.rmi.RemoteException;

public interface Response extends EJBObject {

    public void createResponse(long userId, long questionId, String dataSource)  throws RemoteException, EJBException;

    public void setAnswerId(long userId, long questionId, long answerId, String dataSource) throws RemoteException, EJBException;

    public void setResponseText(long userId, long questionId, String text, String dataSource) throws RemoteException, EJBException;

}
