package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileStatusLu;

/**
 * This is the home interface for the ProfileStatusLu class.
 * @see com.topcoder.web.TCES.ejb.ProfileStatusLu
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileStatusLuHome extends javax.ejb.EJBHome {
	public ProfileStatusLu create() throws RemoteException, CreateException;
}
