package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileSkill;

/**
 * This is the home interface for the ProfileSkill class.
 * @see com.topcoder.web.TCES.ejb.ProfileSkill
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileSkillHome extends javax.ejb.EJBHome {
	public ProfileSkill create() throws RemoteException, CreateException;
}
