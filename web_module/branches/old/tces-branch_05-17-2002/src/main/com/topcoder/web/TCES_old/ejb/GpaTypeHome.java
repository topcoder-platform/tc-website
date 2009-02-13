package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.GpaType;

/**
 * This is the home interface for the GpaType class.
 * @see com.topcoder.web.TCES.ejb.GpaType
 * @author Phil Selby, May 22nd, 2002
 */

public interface GpaTypeHome extends javax.ejb.EJBHome {
	public GpaType create() throws RemoteException, CreateException;
}
