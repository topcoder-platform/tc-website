package com.topcoder.web.ejb.user;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface UserTermsOfUse extends EJBObject {

    public void createUserTermsOfUse(long userId, long _terms_of_use_id)
            throws EJBException, RemoteException;

    public void removeUserTermsOfUse(long userId, long _terms_of_use_id)
            throws EJBException, RemoteException;

    public boolean hasTermsOfUse(long userId, long termsOfUseId)
            throws EJBException, RemoteException;
}

;
