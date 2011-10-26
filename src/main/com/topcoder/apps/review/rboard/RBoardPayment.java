/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.review.rboard;

import javax.ejb.EJBObject;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.rmi.RemoteException;
import java.sql.Timestamp;

/**
 * RBoardPayment EJB remote interface.
 *
 * @author pulky
 * @version 1.0.0
 */
public interface RBoardPayment extends EJBObject {
    ResultSetContainer getPayments(long projectId, long phaseId, String dataSource) throws  RemoteException;
}

