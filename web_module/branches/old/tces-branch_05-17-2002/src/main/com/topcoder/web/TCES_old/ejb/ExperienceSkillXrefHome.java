package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ExperienceSkillXref;

/**
 * This is the home interface for the ExperienceSkillXref class.
 * @see com.topcoder.web.TCES.ejb.ExperienceSkillXref
 * @author Phil Selby, May 22nd, 2002
 */

public interface ExperienceSkillXrefHome extends javax.ejb.EJBHome {
	public ExperienceSkillXref create() throws RemoteException, CreateException;
}
