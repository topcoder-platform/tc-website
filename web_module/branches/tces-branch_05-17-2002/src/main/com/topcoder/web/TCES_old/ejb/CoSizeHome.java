package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.CoSize;

/**
 * This is the home interface for the CoSize class.
 * @see com.topcoder.web.TCES.ejb.CoSize
 * @author Phil Selby, May 22nd, 2002
 */

public interface CoSizeHome extends javax.ejb.EJBHome {
	public CoSize create() throws RemoteException, CreateException;
}
