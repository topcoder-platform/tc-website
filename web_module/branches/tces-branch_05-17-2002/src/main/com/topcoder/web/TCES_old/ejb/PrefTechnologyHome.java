package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefTechnology;

/**
 * This is the home interface for the PrefTechnology class.
 * @see com.topcoder.web.TCES.ejb.PrefTechnology
 * @author Phil Selby, May 22nd, 2002
 */

public interface PrefTechnologyHome extends javax.ejb.EJBHome {
	public PrefTechnology create() throws RemoteException, CreateException;
}
