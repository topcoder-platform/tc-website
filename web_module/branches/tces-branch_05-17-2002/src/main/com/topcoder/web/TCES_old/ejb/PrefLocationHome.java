package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefLocation;

/**
 * This is the home interface for the PrefLocation class.
 * @see com.topcoder.web.TCES.ejb.PrefLocation
 * @author Phil Selby, May 22nd, 2002
 */

public interface PrefLocationHome extends javax.ejb.EJBHome {
	public PrefLocation create() throws RemoteException, CreateException;
}
