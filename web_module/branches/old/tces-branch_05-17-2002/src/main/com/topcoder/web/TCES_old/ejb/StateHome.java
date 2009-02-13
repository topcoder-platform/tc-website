package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.State;

/**
 * This is the home interface for the State class.
 * @see com.topcoder.web.TCES.ejb.State
 * @author Phil Selby, May 22nd, 2002
 */

public interface StateHome extends javax.ejb.EJBHome {
	public State create() throws RemoteException, CreateException;
}
