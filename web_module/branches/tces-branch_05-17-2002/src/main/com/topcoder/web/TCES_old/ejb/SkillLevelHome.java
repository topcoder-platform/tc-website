package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.SkillLevel;

/**
 * This is the home interface for the SkillLevel class.
 * @see com.topcoder.web.TCES.ejb.SkillLevel
 * @author Phil Selby, May 22nd, 2002
 */

public interface SkillLevelHome extends javax.ejb.EJBHome {
	public SkillLevel create() throws RemoteException, CreateException;
}
