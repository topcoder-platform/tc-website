package com.topcoder.web.hs.ejb.coder;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 19, 2002 11:31:25 PM
 */
public interface CoderHome extends EJBHome{

     public static final String EJB_REF_NAME = "com.topcoder.web.hs.ejb.coder.CoderHome";

    /**
     *
     * @return Coder EJB Object
     * @throws javax.ejb.CreateException
     * @throws java.rmi.RemoteException
     */
    Coder create() throws CreateException, RemoteException;
}
