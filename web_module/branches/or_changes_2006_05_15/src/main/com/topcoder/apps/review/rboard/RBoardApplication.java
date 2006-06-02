package com.topcoder.apps.review.rboard;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.sql.Timestamp;

/**
 * @author dok
 * Date: Feb 12, 2004
 */
public interface RBoardApplication extends EJBObject {

    // Minimum time that must elapse between applications by the same
    // reviewer (in milliseconds).
    public static final int APPLICATION_DELAY = 6 * 60 * 60 * 1000;

    void createRBoardApplication(String dataSource, long userId, long projectId, int reviewRespId, int phaseId, boolean primary) throws RemoteException;

    int getReviewRespId(String dataSource, long userId, long projectId, int phaseId) throws RemoteException;

    boolean isPrimary(String dataSource, long userId, long projectId, int phaseId) throws RemoteException;

    boolean exists(String dataSource, long userId, long projectId, int phaseId) throws RemoteException;

    ResultSetContainer getReviewers(String dataSource, long projectId, int phaseId) throws RemoteException;

    Timestamp getLatestReviewApplicationTimestamp(String dataSource, long userId) throws RemoteException;
    
    void validateUser(String dataSource, int catalog, int reviewTypeId, long userId, int phaseId) throws RemoteException;

    public void validateUserTrans(String dataSource, long projectId, int phaseId, long userId, Timestamp opensOn, int reviewTypeId, boolean primary) throws RemoteException;
}

