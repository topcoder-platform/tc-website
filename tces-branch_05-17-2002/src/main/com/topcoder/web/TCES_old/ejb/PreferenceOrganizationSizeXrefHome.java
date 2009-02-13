package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PreferenceOrganizationSizeXref;

/**
 * This is the home interface for the PreferenceOrganizationSizeXref class.
 * @see com.topcoder.web.TCES.ejb.PreferenceOrganizationSizeXref
 * @author Phil Selby, May 22nd, 2002
 */

public interface PreferenceOrganizationSizeXrefHome extends javax.ejb.EJBHome {
	public PreferenceOrganizationSizeXref create() throws RemoteException, CreateException;
}
