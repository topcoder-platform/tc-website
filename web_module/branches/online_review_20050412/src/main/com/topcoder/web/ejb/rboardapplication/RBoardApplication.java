package com.topcoder.web.ejb.rboardapplication;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * @author dok
 * Date: Feb 12, 2004
 */
public interface RBoardApplication extends EJBObject {

    /**
     *
     *
     * @see com.topcoder.web.ejb.rboardapplication.RBoardApplicationBean#createRBoardApplication
     */
    void createRBoardApplication(String dataSource, long userId, long projectId, int phaseId) throws RemoteException;

    void setReviewRespId(String dataSource, long userId, long projectId, int phaseId, int reviewRespId) throws RemoteException;

    void setPrimary(String dataSource, long userId, long projectId, int phaseId, boolean isPrimary) throws RemoteException;

    int getReviewRespId(String dataSource, long userId, long projectId, int phaseId) throws RemoteException;

    boolean isPrimary(String dataSource, long userId, long projectId, int phaseId) throws RemoteException;

    boolean exists(String dataSource, long userId, long projectId, int phaseId) throws RemoteException;

    ResultSetContainer getReviewers(String dataSource, long projectId, int phaseId) throws RemoteException;

}

