package com.topcoder.web.ejb.user;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface UserTermsOfUse extends EJBObject {

    public void createUserTermsOfUse(long _user_id, long _terms_of_use_id)
            throws EJBException, RemoteException;

    public void removeUserTermsOfUse(long _user_id, long _terms_of_use_id)
            throws EJBException, RemoteException;

    public boolean hasTermsOfUse(long userId, long termsOfUseId)
            throws EJBException, RemoteException;
}

;
