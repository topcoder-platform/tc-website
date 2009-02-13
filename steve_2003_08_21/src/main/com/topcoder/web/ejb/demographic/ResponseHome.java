package com.topcoder.web.ejb.demographic;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface ResponseHome extends EJBHome {
        public Response create() throws CreateException, RemoteException;
}
