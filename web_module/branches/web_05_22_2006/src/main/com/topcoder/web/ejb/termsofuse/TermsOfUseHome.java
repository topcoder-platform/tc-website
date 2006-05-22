package com.topcoder.web.ejb.termsofuse;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface TermsOfUseHome extends EJBHome {

    public final static String EJB_REF_NAME =
            "com.topcoder.web.ejb.termsofuse.TermsOfUseHome";

    TermsOfUse create() throws CreateException, RemoteException;

}


