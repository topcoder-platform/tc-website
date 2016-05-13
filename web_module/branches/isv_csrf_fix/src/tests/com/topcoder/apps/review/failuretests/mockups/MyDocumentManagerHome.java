/*
 * MyDocumentManagerHome.java 1.0 6/30/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.HashMap;
import java.rmi.RemoteException;
import javax.ejb.Handle;
import javax.ejb.HomeHandle;
import javax.ejb.EJBMetaData;
import javax.ejb.RemoveException;
import javax.ejb.CreateException;

import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.DocumentManagerLocalHome;

/**
 * <p>A mockup implementation of DocumentManagerHome used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyDocumentManagerHome extends EJBHomeBase
        implements DocumentManagerLocalHome {
    /**
     * <p>Returns a new instance of MyDocumentManager.</p>
     */
    public DocumentManagerLocal create() throws CreateException {
        return (new MyDocumentManager());
    }
}
