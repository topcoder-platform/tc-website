package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileSkillXref;

/**
 * This is the home interface for the ProfileSkillXref class.
 * @see com.topcoder.web.TCES.ejb.ProfileSkillXref
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileSkillXrefHome extends javax.ejb.EJBHome {
	public ProfileSkillXref create() throws RemoteException, CreateException;
}
