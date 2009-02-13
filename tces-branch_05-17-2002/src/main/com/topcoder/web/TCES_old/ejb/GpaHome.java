package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Gpa;

/**
 * This is the home interface for the Gpa class.
 * @see com.topcoder.web.TCES.ejb.Gpa
 * @author Phil Selby, May 22nd, 2002
 */

public interface GpaHome extends javax.ejb.EJBHome {
	public Gpa create() throws RemoteException, CreateException;
}
