package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Profile;

/**
 * This is the home interface for the Profile class.
 * @see com.topcoder.web.TCES.ejb.Profile
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileHome extends javax.ejb.EJBHome {
	public Profile create() throws RemoteException, CreateException;
}
