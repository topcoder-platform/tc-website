package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PreferenceJobRoleXref;

/**
 * This is the home interface for the PreferenceJobRoleXref class.
 * @see com.topcoder.web.TCES.ejb.PreferenceJobRoleXref
 * @author Phil Selby, May 22nd, 2002
 */

public interface PreferenceJobRoleXrefHome extends javax.ejb.EJBHome {
	public PreferenceJobRoleXref create() throws RemoteException, CreateException;
}
