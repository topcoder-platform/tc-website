package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.AdditionalSkill;

/**
 * This is the home interface for the AdditionalSkill class.
 * @see com.topcoder.web.TCES.ejb.AdditionalSkill
 * @author Phil Selby, May 22nd, 2002
 */

public interface AdditionalSkillHome extends javax.ejb.EJBHome {
	public AdditionalSkill create() throws RemoteException, CreateException;
}
