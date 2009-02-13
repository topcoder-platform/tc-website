package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PreferenceLocationXref;

/**
 * This is the home interface for the PreferenceLocationXref class.
 * @see com.topcoder.web.TCES.ejb.PreferenceLocationXref
 * @author Phil Selby, May 22nd, 2002
 */

public interface PreferenceLocationXrefHome extends javax.ejb.EJBHome {
	public PreferenceLocationXref create() throws RemoteException, CreateException;
}
