package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileResponse;

/**
 * This is the home interface for the ProfileResponse class.
 * @see com.topcoder.web.TCES.ejb.ProfileResponse
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileResponseHome extends javax.ejb.EJBHome {
	public ProfileResponse create() throws RemoteException, CreateException;
}
