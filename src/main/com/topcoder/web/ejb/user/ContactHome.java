package com.topcoder.web.ejb.user;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public interface ContactHome extends javax.ejb.EJBHome {
    /**
    *
    * @return
    * @throws CreateException
    * @throws RemoteException
    *
    */
    public Contact create() throws CreateException, RemoteException;
}