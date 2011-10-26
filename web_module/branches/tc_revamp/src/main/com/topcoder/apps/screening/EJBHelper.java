/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

import com.topcoder.apps.screening.application.AppSpecification;
import com.topcoder.apps.screening.application.AppSpecificationHome;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import java.rmi.RemoteException;

/**
 * Helper class that handles the communication with the EJBs from the persistance layer EJBs.
 *
 * @author pulky
 * @version 1.0.0
 */
public class EJBHelper {
    /**
     * The app specification instance.
     */
    private static AppSpecification appSpecification = null;

    /**
     * Constructor (inhibits outside instantiation).
     */
    private EJBHelper() {
    }

    /**
     * Get an instance of the Specification EJB.
     *
     * @return the AppSpecification instance
     *
     * @throws NamingException thrown from the EJB lookup code
     * @throws RemoteException thrown from the EJB lookup code
     * @throws CreateException thrown from the EJB lookup code
     */
    public static synchronized AppSpecification getAppSpecification() throws NamingException, RemoteException, CreateException {
        if (appSpecification == null) {
            Context initial = new InitialContext();
            Object objref = initial.lookup(AppSpecification.EJB_REF_NAME);
            AppSpecificationHome home = (AppSpecificationHome) PortableRemoteObject.narrow(objref, AppSpecificationHome.class);
            appSpecification = home.create();
        }
        return appSpecification;
    }
}

