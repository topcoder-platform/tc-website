package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.JobType;

/**
 * This is the home interface for the JobType class.
 * @see com.topcoder.web.TCES.ejb.JobType
 * @author Phil Selby, May 22nd, 2002
 */

public interface JobTypeHome extends javax.ejb.EJBHome {
	public JobType create() throws RemoteException, CreateException;
}
