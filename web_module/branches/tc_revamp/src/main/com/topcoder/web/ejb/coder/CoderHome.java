package com.topcoder.web.ejb.coder;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision: 31164 $
 * Dec 19, 2002 11:31:25 PM
 */
public interface CoderHome extends EJBHome {

    public static final String EJB_REF_NAME = "com.topcoder.web.ejb.coder.CoderHome";

    /**
     *
     * @return Coder EJB Object
     * @throws javax.ejb.CreateException
     * @throws java.rmi.RemoteException
     */
    Coder create() throws CreateException, RemoteException;
}
