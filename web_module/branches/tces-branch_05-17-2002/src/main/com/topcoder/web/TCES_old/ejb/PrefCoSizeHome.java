package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefCoSize;

/**
 * This is the home interface for the PrefCoSize class.
 * @see com.topcoder.web.TCES.ejb.PrefCoSize
 * @author Phil Selby, May 22nd, 2002
 */

public interface PrefCoSizeHome extends javax.ejb.EJBHome {
	public PrefCoSize create() throws RemoteException, CreateException;
}
