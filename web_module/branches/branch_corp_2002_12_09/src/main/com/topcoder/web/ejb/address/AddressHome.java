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
    public static final String EJB_REF_NAME = AddressHome.class.getName();
    /**
    *
    * @return
    * @throws CreateException
    * @throws RemoteException
    *
    */
    public Address create() throws CreateException, RemoteException;
}