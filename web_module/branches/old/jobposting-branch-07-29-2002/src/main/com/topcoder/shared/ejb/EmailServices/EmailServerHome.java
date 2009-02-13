package com.topcoder.shared.ejb.EmailServices;

import javax.ejb.*;
import java.rmi.RemoteException;

/**
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1.2.1  2002/04/25 04:52:35  sord
 *           Initial version.
 *
 */
public interface EmailServerHome extends EJBHome {
    public EmailServer create() throws CreateException, RemoteException;
}

