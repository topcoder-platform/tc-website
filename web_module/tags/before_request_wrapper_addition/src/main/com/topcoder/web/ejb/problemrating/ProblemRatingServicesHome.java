package com.topcoder.web.ejb.problemrating;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface ProblemRatingServicesHome extends EJBHome {
    public ProblemRatingServices create() throws CreateException, RemoteException;
}
