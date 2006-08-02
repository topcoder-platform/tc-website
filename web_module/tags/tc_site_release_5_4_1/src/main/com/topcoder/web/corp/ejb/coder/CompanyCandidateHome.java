package com.topcoder.web.corp.ejb.coder;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 27, 2003 1:36:55 AM
 */

public interface CompanyCandidateHome extends EJBHome {

    /**
     *
     * @return a remote interface to CompanyCandidate
     * @throws CreateException
     * @throws RemoteException
     */
    CompanyCandidate create() throws CreateException, RemoteException;

}
