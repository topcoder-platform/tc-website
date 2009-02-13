package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.User;

/**
 * This is the home interface for the User class.
 * @see com.topcoder.web.TCES.ejb.User
 * @author Phil Selby, May 22nd, 2002
 */

public interface UserHome extends javax.ejb.EJBHome {
	public User create() throws RemoteException, CreateException;
}
