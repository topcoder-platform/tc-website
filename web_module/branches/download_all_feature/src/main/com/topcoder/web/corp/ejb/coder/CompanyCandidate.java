package com.topcoder.web.corp.ejb.coder;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 27, 2003 1:34:56 AM
 */
public interface CompanyCandidate extends EJBObject {

    /**
     *
     * @param companyId
     * @param candidateId
     * @throws RemoteException
     */
    public void createCompanyCandidate(long companyId, long candidateId)
            throws RemoteException;

    /**
     *
     * @param companyId
     * @param candidateId
     * @throws RemoteException
     */
    public void removeCompanyCandidate(long companyId, long candidateId)
            throws RemoteException;

}
