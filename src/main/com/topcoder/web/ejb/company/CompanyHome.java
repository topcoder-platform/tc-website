package com.topcoder.web.ejb.company;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public interface CompanyHome extends javax.ejb.EJBHome {
    /**
    *
    * @return
    * @throws CreateException
    * @throws RemoteException
    *
    */
    public Company create() throws CreateException, RemoteException;
}