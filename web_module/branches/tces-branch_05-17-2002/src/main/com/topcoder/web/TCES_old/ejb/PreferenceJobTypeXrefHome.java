package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PreferenceJobTypeXref;

/**
 * This is the home interface for the PreferenceJobTypeXref class.
 * @see com.topcoder.web.TCES.ejb.PreferenceJobTypeXref
 * @author Phil Selby, May 22nd, 2002
 */

public interface PreferenceJobTypeXrefHome extends javax.ejb.EJBHome {
	public PreferenceJobTypeXref create() throws RemoteException, CreateException;
}
