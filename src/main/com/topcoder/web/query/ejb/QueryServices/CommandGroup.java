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
public interface CommandGroup extends EJBObject {

    void createCommandGroup(String commandGroupDesc) throws RemoteException, EJBException;

    void setCommandGroupDesc(int commandGroupId, String commandGroupDesc) throws RemoteException, EJBException;

    String getCommandGroupDesc(int commandGroupId) throws RemoteException, EJBException;

    void setDataSource(String dataSourceName) throws RemoteException, EJBException;

    ResultSetContainer getAllCommandGroups() throws RemoteException, EJBException;


}

