package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileExperience;

/**
 * This is the home interface for the ProfileExperience class.
 * @see com.topcoder.web.TCES.ejb.ProfileExperience
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileExperienceHome extends javax.ejb.EJBHome {
	public ProfileExperience create() throws RemoteException, CreateException;
}
