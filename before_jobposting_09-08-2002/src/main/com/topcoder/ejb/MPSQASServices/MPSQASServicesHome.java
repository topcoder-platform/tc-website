package com.topcoder.ejb.MPSQASServices;

//package ejb.MPSQASServices;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 * The home for the MPSQASServicesBean
 *
 * @author mitalub
 */
public interface MPSQASServicesHome extends EJBHome {
    public MPSQASServices create() throws CreateException, RemoteException;
}
