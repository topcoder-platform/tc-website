package com.topcoder.dde.submission;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 */
public interface SubmittersHome extends EJBHome {

    public static final String EJB_REF_NAME = "java:comp/env/ejb/SubmittersEJB";

    public Submitters create() throws CreateException, RemoteException;
}
