package com.topcoder.web.ejb.termsofuse;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface TermsOfUseHome extends EJBHome {

  public final static String EJB_REF_NAME=
                               "com.topcoder.web.ejb.termsofuse.TermsOfUseHome";

  TermsOfUse create() throws CreateException, RemoteException;

};
