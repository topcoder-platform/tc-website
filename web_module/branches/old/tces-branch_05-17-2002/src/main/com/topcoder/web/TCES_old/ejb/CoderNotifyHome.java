package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.CoderNotify;

/**
 * This is the home interface for the CoderNotify class.
 * @see com.topcoder.web.TCES.ejb.CoderNotify
 * @author Phil Selby, May 22nd, 2002
 */

public interface CoderNotifyHome extends javax.ejb.EJBHome {
	public CoderNotify create() throws RemoteException, CreateException;
}
