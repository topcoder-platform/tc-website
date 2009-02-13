package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Contact2;

/**
 * This is the home interface for the Contact2 class.
 * @see com.topcoder.web.TCES.ejb.Contact
 * @author Phil Selby, June 12th, 2002
 */

public interface Contact2Home extends javax.ejb.EJBHome {
	public Contact2 create() throws RemoteException, CreateException;
}
