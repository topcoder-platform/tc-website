package com.topcoder.web.ejb.project;

import com.topcoder.web.common.RowNotFoundException;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision: 63619 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 17, 2006
 */
public interface ProjectWager extends EJBObject {
    void createProjectWager(long projectId, long userId, int wagerAmount, String dataSource) throws RemoteException;

    void updateProjectWager(long projectId, long userId, int wagerAmount, String dataSource) throws RowNotFoundException, RemoteException;

    boolean exists(long projectId, long userId, String dataSource) throws RemoteException;

    int getWager(long projectId, long userId, String dataSource) throws RowNotFoundException, RemoteException;
}
