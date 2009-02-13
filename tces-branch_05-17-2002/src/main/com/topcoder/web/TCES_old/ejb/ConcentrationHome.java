package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Concentration;

/**
 * This is the home interface for the Concentration class.
 * @see com.topcoder.web.TCES.ejb.Concentration
 * @author Phil Selby, May 22nd, 2002
 */

public interface ConcentrationHome extends javax.ejb.EJBHome {
	public Concentration create() throws RemoteException, CreateException;
}
