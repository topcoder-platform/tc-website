package com.topcoder.web.ejb.demographic;

import com.topcoder.web.ejb.survey.Response;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface ResponseHome extends EJBHome {
        public Response create() throws CreateException, RemoteException;
}
