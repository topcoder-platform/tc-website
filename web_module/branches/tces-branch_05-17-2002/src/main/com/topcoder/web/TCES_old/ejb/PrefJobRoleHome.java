package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefJobRole;

/**
 * This is the home interface for the PrefJobRole class.
 * @see com.topcoder.web.TCES.ejb.PrefJobRole
 * @author Phil Selby, May 22nd, 2002
 */

public interface PrefJobRoleHome extends javax.ejb.EJBHome {
	public PrefJobRole create() throws RemoteException, CreateException;
}
