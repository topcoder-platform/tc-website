/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.screening.application;

import javax.ejb.EJBObject;

import java.rmi.RemoteException;
import java.sql.Connection;

/**
 * AppSpecification EJB remote interface.
 *
 * @author pulky
 * @version 1.0.0
 */
public interface AppSpecification extends EJBObject {
    public static final String EJB_REF_NAME = "com.topcoder.apps.screening.application.AppSpecificationHome";

    void insertSpecification(Connection conn, ApplicationSpecification appSpec) throws  RemoteException;
    ApplicationSpecification[] getSpecifications(Connection conn, long specificationUploaderId) throws RemoteException;
    public ApplicationSpecification getSpecification(Connection conn, long specificationId) throws RemoteException;
}

