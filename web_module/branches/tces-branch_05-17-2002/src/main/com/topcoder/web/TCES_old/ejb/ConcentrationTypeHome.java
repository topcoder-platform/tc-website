package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ConcentrationType;

/**
 * This is the home interface for the ConcentrationType class.
 * @see com.topcoder.web.TCES.ejb.ConcentrationType
 * @author Phil Selby, May 22nd, 2002
 */

public interface ConcentrationTypeHome extends javax.ejb.EJBHome {
	public ConcentrationType create() throws RemoteException, CreateException;
}
