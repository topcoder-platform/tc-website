package com.topcoder.web.ejb.termsofuse;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import javax.ejb.EJBException;


/**
 * EJB object for Terms Of Use table get/set functions
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface TermsOfUse extends EJBObject {
    /**
     *
     *
     * @see com.topcoder.web.ejb.termsofuse.TermsOfUseBean#createTermsOfUse
     */
    long createTermsOfUse() throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.termsofuse.TermsOfUseBean#setText
     */
    void setText(long termsOfUseId, String text)
          throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.termsofuse.TermsOfUseBean#setTermsOfUseTypeId
     */
    void setTermsOfUseTypeId(long termsOfUseId, long id)
                      throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.termsofuse.TermsOfUseBean#getText
     */
    String getText(long termsOfUseId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.termsofuse.TermsOfUseBean#getTermsOfUseTypeId
     */
    long getTermsOfUseTypeId(long termsOfUseId)
                      throws RemoteException, EJBException;
}
