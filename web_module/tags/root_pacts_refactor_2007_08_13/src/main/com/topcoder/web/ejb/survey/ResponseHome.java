package com.topcoder.web.ejb.survey;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface ResponseHome extends EJBHome {
    public Response create() throws CreateException, RemoteException;
}
