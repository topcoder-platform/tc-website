package com.topcoder.shared.ejb.EmailServices;

import javax.ejb.*;
import java.rmi.RemoteException;

/**
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.2.2.1  2002/04/11 18:20:28  apps
 *           SB -- readded EmailServices
 *
 *           Revision 1.2  2002/04/05 04:18:38  apps
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
public interface EmailListGroupHome extends EJBHome {
    public EmailListGroup create() throws CreateException, RemoteException;
}
