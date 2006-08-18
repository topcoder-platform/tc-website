package com.topcoder.web.ejb.roundregistration;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface RoundRegistrationHome extends EJBHome {
    RoundRegistration create() throws CreateException, RemoteException;
}