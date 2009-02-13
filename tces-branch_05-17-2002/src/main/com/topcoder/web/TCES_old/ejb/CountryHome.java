package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Country;

/**
 * This is the home interface for the Country class.
 * @see com.topcoder.web.TCES.ejb.Country
 * @author Phil Selby, May 22nd, 2002
 */

public interface CountryHome extends javax.ejb.EJBHome {
	public Country create() throws RemoteException, CreateException;
}
