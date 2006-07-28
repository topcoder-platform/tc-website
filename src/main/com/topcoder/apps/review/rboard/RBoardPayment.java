/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.review.rboard;

import javax.ejb.EJBObject;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

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
public interface RBoardPayment extends EJBObject {
    ResultSetContainer getPayments(long projectId, long phaseId, String dataSource) throws  RemoteException;
}

