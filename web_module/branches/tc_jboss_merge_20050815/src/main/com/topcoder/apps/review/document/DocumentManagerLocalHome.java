/*
 * DocumentManagerLocalHome.java
 *
 * Copyright � 2002, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;


/**
 * This class is provided as part of the EJB framework as a utility for obtaining a DoucmentManager implementation.
 *
 * @author TCSDeveloper
 */
public interface DocumentManagerLocalHome extends EJBLocalHome {
    public static final String EJB_REF_NAME = "com.topcoder.apps.review.document.DocumentManagerLocalHome";

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     *
     * @throws CreateException DOCUMENT ME!
     */
    public DocumentManagerLocal create() throws CreateException;
}
