package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefJobType;

/**
 * This is the home interface for the PrefJobType class.
 * @see com.topcoder.web.TCES.ejb.PrefJobType
 * @author Phil Selby, May 22nd, 2002
 */

public interface PrefJobTypeHome extends javax.ejb.EJBHome {
	public PrefJobType create() throws RemoteException, CreateException;
}
