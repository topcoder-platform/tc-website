package com.topcoder.web.ejb.termsofuse;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public interface TermsOfUseHome extends javax.ejb.EJBHome {
    /**
    *
    * @return
    * @throws CreateException
    * @throws RemoteException
    *
    */
    public TermsOfUse create() throws CreateException, RemoteException;
}