package com.topcoder.web.ejb.address;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public interface AddressHome extends javax.ejb.EJBHome {
    /**
    *
    * @return
    * @throws CreateException
    * @throws RemoteException
    *
    */
    public Address create() throws CreateException, RemoteException;
}