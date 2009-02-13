package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.SkillLevelLu;

/**
 * This is the home interface for the SkillLevelLu class.
 * @see com.topcoder.web.TCES.ejb.SkillLevelLu
 * @author Phil Selby, May 22nd, 2002
 */

public interface SkillLevelLuHome extends javax.ejb.EJBHome {
	public SkillLevelLu create() throws RemoteException, CreateException;
}
