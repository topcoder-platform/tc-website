package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Coder;

/**
 * This is the home interface for the Coder class.
 * @see com.topcoder.web.TCES.ejb.Coder
 * @author Phil Selby, May 22nd, 2002
 */

public interface CoderHome extends javax.ejb.EJBHome {
	public Coder create() throws RemoteException, CreateException;
}
