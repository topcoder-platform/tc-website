package com.topcoder.shared.ejb.EmailServices;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 * @author   Eric Ellingson
 * @version  $Revision$
 *  Log of Changes:
 *           $Log$
 *           Revision 1.3  2002/07/16 21:37:45  gpaul
 *           merging in sord email changes
 *
 *           Revision 1.3.2.1  2002/04/11 18:20:28  apps
 *           SB -- readded EmailServices
 *
 *           Revision 1.3  2002/04/09 02:33:44  apps
 *           Changed to extend EJBHome (like it is supposed to).
 *
 *           Revision 1.2  2002/04/05 03:34:21  apps
 *           Fixed formatting by replacing tabs with spaces.
 *
 *           Revision 1.1.1.1  2002/04/02 10:42:29  apps
 *           no message
 *
 *           Revision 1.1.2.1  2002/04/02 10:34:32  apps
 *           Initial version.
 *           Interface declared.
 *
 */
public interface EmailTemplateHome extends EJBHome {
    /**
     *
     * @return
     * @throws CreateException
     * @throws RemoteException
     */
    public EmailTemplate create() throws CreateException, RemoteException;
}
