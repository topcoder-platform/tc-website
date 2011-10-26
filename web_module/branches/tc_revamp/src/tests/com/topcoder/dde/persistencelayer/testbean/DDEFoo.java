package com.topcoder.dde.persistencelayer.testbean;

import java.rmi.RemoteException;
import javax.ejb.EJBObject;

public interface DDEFoo extends EJBObject {

    void testAll() throws Throwable, RemoteException;

}
