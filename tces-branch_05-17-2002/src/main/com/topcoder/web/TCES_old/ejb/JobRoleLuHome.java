package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.JobRoleLu;

/**
 * This is the home interface for the JobRoleLu class.
 * @see com.topcoder.web.TCES.ejb.JobRoleLu
 * @author Phil Selby, May 22nd, 2002
 */

public interface JobRoleLuHome extends javax.ejb.EJBHome {
	public JobRoleLu create() throws RemoteException, CreateException;
}
