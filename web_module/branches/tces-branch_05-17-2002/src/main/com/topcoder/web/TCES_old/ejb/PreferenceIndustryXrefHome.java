package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PreferenceIndustryXref;

/**
 * This is the home interface for the PreferenceIndustryXref class.
 * @see com.topcoder.web.TCES.ejb.PreferenceIndustryXref
 * @author Phil Selby, May 22nd, 2002
 */

public interface PreferenceIndustryXrefHome extends javax.ejb.EJBHome {
	public PreferenceIndustryXref create() throws RemoteException, CreateException;
}
