package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Industry;

/**
 * This is the home interface for the Industry class.
 * @see com.topcoder.web.TCES.ejb.Industry
 * @author Phil Selby, May 22nd, 2002
 */

public interface IndustryHome extends javax.ejb.EJBHome {
	public Industry create() throws RemoteException, CreateException;
}
