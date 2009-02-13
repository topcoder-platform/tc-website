package com.topcoder.web.ejb.survey;

import javax.ejb.EJBObject;
import javax.ejb.EJBException;
import java.rmi.RemoteException;

public interface Response extends EJBObject{

    public void createResponse(long userId, long questionId, long answerId)  throws RemoteException, EJBException;

    public void createResponse(long userId, long questionId, String text)  throws RemoteException, EJBException;

    public boolean exists(long userId, long questionId) throws RemoteException, EJBException;
}
