/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.review.rboard;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 * Home iterface for the RBoardPayment EJB.
 *
 * @author pulky
 * @version 1.0.0
 */
public interface RBoardPaymentHome extends javax.ejb.EJBHome {
    public static final String EJB_REF_NAME = "com.topcoder.apps.review.rboard.RBoardPaymentHome";

    public RBoardPayment create() throws CreateException, RemoteException;
}
