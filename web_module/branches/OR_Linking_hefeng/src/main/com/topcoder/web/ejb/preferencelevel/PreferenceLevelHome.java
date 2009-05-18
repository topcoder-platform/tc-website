/*
 * TCS Screening Tool 1.1
 *
 * PreferenceLevelHome.java
 *
 * 1.0 07/14/2004
 */
package com.topcoder.web.ejb.preferencelevel;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 * <p>A remote <code>Home</code> interface for <code>Preference Level EJB</code>. The clients of <code>Preference Level
 * EJB</code> should use this interface obtained from the <code>JNDI</code> context to create the instances of <code>
 * Preference Level EJB</code>.</p>
 *
 * @author  isv
 * @version 1.0 07/14/2004
 * @since   Screening Tool 1.1
 */
public interface PreferenceLevelHome extends EJBHome {

    /**
     * Constructs new instance of <code>Preference Level EJB</code> that may be used to manage the preference level for
     * company users.
     *
     * @return a <code>PreferenceLevel</code> instance to be used to manipulate with preference levels for company
     *         users.
     * @throws CreateException if a failure occurs while creating new <code>PreferenceLevel</code> object.
     * @throws RemoteException as required by the <code>EJB Specification</code>.
     */
    PreferenceLevel create() throws CreateException, RemoteException;
}
