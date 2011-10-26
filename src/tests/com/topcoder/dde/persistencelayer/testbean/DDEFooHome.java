package com.topcoder.dde.persistencelayer.testbean;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface DDEFooHome extends EJBHome {

    DDEFoo create() throws CreateException, RemoteException;

}
