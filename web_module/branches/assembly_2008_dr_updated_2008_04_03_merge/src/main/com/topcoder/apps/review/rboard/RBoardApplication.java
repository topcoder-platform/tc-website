/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.review.rboard;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.sql.Timestamp;

/**
 * RBoard EJB remote interface.
 *
 * <p>
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * Bean was moved from tc to tcs site and was updated to centralize all RBoard operations.
 * </li>
 * </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.0.1
 */
public interface RBoardApplication extends EJBObject {
    public static final int APPLICATION_DELAY = 6 * 60 * 60 * 1000;

    void createRBoardApplication(String dataSource, long userId, long projectId, int reviewRespId, int phaseId, Timestamp opensOn, int reviewTypeId, boolean primary) throws RBoardRegistrationException, RemoteException;

    Timestamp getLatestReviewApplicationTimestamp(String dataSource, long userId) throws RemoteException;

    void validateUser(String dataSource, int catalog, int reviewTypeId, long userId, int phaseId) throws RBoardRegistrationException, RemoteException;

    public void validateUserTrans(String dataSource, long projectId, int phaseId, long userId, Timestamp opensOn, int reviewTypeId, boolean primary) throws RBoardRegistrationException, RemoteException;
}

