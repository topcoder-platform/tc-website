package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ManagementLevelLu;

/**
 * This is the home interface for the ManagementLevelLu class.
 * @see com.topcoder.web.TCES.ejb.ManagementLevelLu
 * @author Phil Selby, May 22nd, 2002
 */

public interface ManagementLevelLuHome extends javax.ejb.EJBHome {
	public ManagementLevelLu create() throws RemoteException, CreateException;
}
