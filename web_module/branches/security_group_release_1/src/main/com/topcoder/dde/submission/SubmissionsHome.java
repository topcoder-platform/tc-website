package com.topcoder.dde.submission;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 */
public interface SubmissionsHome extends EJBHome {

    public static final String EJB_REF_NAME = "java:comp/env/ejb/SubmissionsEJB";

    public Submissions create() throws CreateException, RemoteException;
}
