package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Location;

/**
 * This is the home interface for the Location class.
 * @see com.topcoder.web.TCES.ejb.Location
 * @author Phil Selby, May 22nd, 2002
 */

public interface LocationHome extends javax.ejb.EJBHome {
	public Location create() throws RemoteException, CreateException;
}
