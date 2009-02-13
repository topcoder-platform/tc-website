/*
 * TCSEJBTestRunnerHome.java
 *
 * Adapted by John C. Bollinger from code from the JUnitEJB utility
 *
 * Distributable under LGPL license.
 * See terms of license at gnu.org.
 */
package com.topcoder.dde.user.test;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

import net.sourceforge.junitejb.EJBTestRunner;

/**
 * Remote home interface of the ejb test runner.
 *
 * @author <a href="mailto:dain@daingroup.com">Dain Sundstrom</a>
 * @version $Revision$
 */
public interface TCSEJBTestRunnerHome extends EJBHome {
    /**
     * Creates an ejb test runner.
     * @return a new EJBTestRunner
     */
    public EJBTestRunner create(long uid) throws RemoteException, CreateException;
}
