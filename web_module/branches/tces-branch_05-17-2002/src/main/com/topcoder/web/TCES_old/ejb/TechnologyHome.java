package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Technology;

/**
 * This is the home interface for the Technology class.
 * @see com.topcoder.web.TCES.ejb.Technology
 * @author Phil Selby, May 22nd, 2002
 */

public interface TechnologyHome extends javax.ejb.EJBHome {
	public Technology create() throws RemoteException, CreateException;
}
