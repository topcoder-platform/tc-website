package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.EJBException;
import javax.ejb.EJBObject;

public interface UserTermsOfUse extends EJBObject {

    public void createUserTermsOfUse(long userId,long termsOfUseId)
                                           throws EJBException, RemoteException;

    public void removeUserTermsOfUse(long userId,long termsOfUseId)
                                           throws EJBException, RemoteException;

};
