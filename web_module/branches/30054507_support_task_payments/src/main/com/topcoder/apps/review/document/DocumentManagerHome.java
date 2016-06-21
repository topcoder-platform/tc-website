/*
 * DocumentManagerHome.java
 *
 * Copyright � 2002, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;


/**
 * This class is provided as part of the EJB framework as a utility for obtaining a DoucmentManager implementation.
 *
 * @author TCSDeveloper
 */
public interface DocumentManagerHome extends EJBHome {
    public static final String EJB_REF_NAME = "com.topcoder.apps.review.document.DocumentManagerHome";

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     *
     * @throws CreateException DOCUMENT ME!
     * @throws RemoteException DOCUMENT ME!
     */
    public DocumentManager create() throws CreateException, RemoteException;
}
