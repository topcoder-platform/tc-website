package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.JobRole;

/**
 * This is the home interface for the JobRole class.
 * @see com.topcoder.web.TCES.ejb.JobRole
 * @author Phil Selby, May 22nd, 2002
 */

public interface JobRoleHome extends javax.ejb.EJBHome {
	public JobRole create() throws RemoteException, CreateException;
}
