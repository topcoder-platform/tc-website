package com.topcoder.web.ejb.jobposting;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * This class creates an instance of JobPostingServices ejb.
 *
 */

public interface JobPostingServicesHome extends EJBHome {

    /**
     *
     * This method returns a JobPostingServices ejb.
     *
     */

    JobPostingServices create() throws CreateException, RemoteException;
}
