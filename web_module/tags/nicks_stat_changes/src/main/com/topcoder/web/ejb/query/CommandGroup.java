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
public interface CommandGroup extends EJBObject {

    int createCommandGroup(String commandGroupName, String dataSourceName) throws RemoteException, EJBException;

    void setCommandGroupName(int commandGroupId, String commandGroupName, String dataSourceName) throws RemoteException, EJBException;

    String getCommandGroupName(int commandGroupId, String dataSourceName) throws RemoteException, EJBException;

    ResultSetContainer getAllCommandGroups(String dataSourceName) throws RemoteException, EJBException;


}

