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
public interface CommandGroup extends EJBObject {

    void createCommandGroup(String commandGroupName) throws RemoteException, EJBException;

    void setCommandGroupName(int commandGroupId, String commandGroupName) throws RemoteException, EJBException;

    String getCommandGroupName(int commandGroupId) throws RemoteException, EJBException;

    void setDataSource(String dataSourceName) throws RemoteException, EJBException;

    ResultSetContainer getAllCommandGroups() throws RemoteException, EJBException;


}

