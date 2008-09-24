/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.screening.application;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 * Home iterface for the AppSpecification EJB.
 *
 * @author pulky
 * @version 1.0.0
 */
public interface AppSpecificationHome extends javax.ejb.EJBHome {
    public static final String EJB_REF_NAME = "com.topcoder.apps.screening.application.AppSpecificationHome";

    public AppSpecification create() throws CreateException, RemoteException;
}
