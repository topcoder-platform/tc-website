package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Skill;

/**
 * This is the home interface for the Skill class.
 * @see com.topcoder.web.TCES.ejb.Skill
 * @author Phil Selby, May 22nd, 2002
 */

public interface SkillHome extends javax.ejb.EJBHome {
	public Skill create() throws RemoteException, CreateException;
}
