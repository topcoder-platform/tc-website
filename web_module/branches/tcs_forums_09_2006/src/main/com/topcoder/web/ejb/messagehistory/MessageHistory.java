package com.topcoder.web.ejb.messagehistory;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import javax.ejb.EJBException;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

public interface MessageHistory extends EJBObject {

    public void addEdit(long messageId, String subject, String body, long modificationDate, String dataSource) throws EJBException, RemoteException;

    public ResultSetContainer getEdits(long messageId, String dataSource) throws EJBException, RemoteException;
    
    public int getEditCount(long messageId, String dataSource) throws EJBException, RemoteException;
}
