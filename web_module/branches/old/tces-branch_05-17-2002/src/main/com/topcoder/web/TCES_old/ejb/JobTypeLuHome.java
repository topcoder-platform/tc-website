package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.JobTypeLu;

/**
 * This is the home interface for the JobTypeLu class.
 * @see com.topcoder.web.TCES.ejb.JobTypeLu
 * @author Phil Selby, May 22nd, 2002
 */

public interface JobTypeLuHome extends javax.ejb.EJBHome {
	public JobTypeLu create() throws RemoteException, CreateException;
}
