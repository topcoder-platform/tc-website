package com.topcoder.web.ejb.user;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import javax.ejb.EJBException;


/**
 * EJB object for User/Terms Of Use table get/set functions
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface UserTermsOfUse extends EJBObject {
    /**
     *
     *
     * @see com.topcoder.web.ejb.user.UserTermsOfUseBean#createUserTermsOfUse
     */
    void createUserTermsOfUse(long userId, long termsOfUseId)
                       throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.userTermsOfUseBean#removeUserTermsOfUse
     */
    void removeUserTermsOfUse(long userId, long termsOfUseId)
                       throws RemoteException, EJBException;
}
