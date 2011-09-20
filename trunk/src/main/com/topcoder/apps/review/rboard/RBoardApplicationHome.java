/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.review.rboard;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 * Home iterface for the RBoard EJB.
 *
 * @author dok, pulky
 * @version 1.0.0
 */

public interface RBoardApplicationHome extends javax.ejb.EJBHome {
    public RBoardApplication create() throws CreateException, RemoteException;
}
