package com.topcoder.web.ejb.user;

import javax.ejb.EJBObject;

import java.rmi.RemoteException;
import javax.ejb.EJBException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public interface UserTermsOfUse extends EJBObject {
    void createUserTermsOfUse(long userId, long termsOfUseId) throws RemoteException, EJBException;
    void removeUserTermsOfUse(long userId, long termsOfUseId) throws RemoteException, EJBException;
}