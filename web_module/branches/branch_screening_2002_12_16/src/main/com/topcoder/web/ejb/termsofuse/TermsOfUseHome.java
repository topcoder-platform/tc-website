package com.topcoder.web.ejb.termsofuse;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface TermsOfUseHome extends EJBHome {

  TermsOfUse create() throws CreateException, RemoteException;

};
