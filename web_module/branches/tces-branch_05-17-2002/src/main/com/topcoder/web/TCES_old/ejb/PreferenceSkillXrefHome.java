package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PreferenceSkillXref;

/**
 * This is the home interface for the PreferenceSkillXref class.
 * @see com.topcoder.web.TCES.ejb.PreferenceSkillXref
 * @author Phil Selby, May 22nd, 2002
 */

public interface PreferenceSkillXrefHome extends javax.ejb.EJBHome {
	public PreferenceSkillXref create() throws RemoteException, CreateException;
}
