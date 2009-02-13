package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Contact;

/**
 * This is the home interface for the Contact class.
 * @see com.topcoder.web.TCES.ejb.Contact
 * @author Phil Selby, June 12th, 2002
 */

public interface ContactHome extends javax.ejb.EJBHome {
	public Contact create() throws RemoteException, CreateException;
}
