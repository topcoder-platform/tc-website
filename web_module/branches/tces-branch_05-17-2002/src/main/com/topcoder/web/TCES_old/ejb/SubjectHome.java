package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Subject;

/**
 * This is the home interface for the Subject class.
 * @see com.topcoder.web.TCES.ejb.Subject
 * @author Phil Selby, May 22nd, 2002
 */

public interface SubjectHome extends javax.ejb.EJBHome {
	public Subject create() throws RemoteException, CreateException;
}
