package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.School;

/**
 * This is the home interface for the School class.
 * @see com.topcoder.web.TCES.ejb.School
 * @author Phil Selby, May 22nd, 2002
 */

public interface SchoolHome extends javax.ejb.EJBHome {
	public School create() throws RemoteException, CreateException;
}
