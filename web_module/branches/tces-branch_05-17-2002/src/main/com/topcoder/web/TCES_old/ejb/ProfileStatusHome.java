package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileStatus;

/**
 * This is the home interface for the ProfileStatus class.
 * @see com.topcoder.web.TCES.ejb.ProfileStatus
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileStatusHome extends javax.ejb.EJBHome {
	public ProfileStatus create() throws RemoteException, CreateException;
}
