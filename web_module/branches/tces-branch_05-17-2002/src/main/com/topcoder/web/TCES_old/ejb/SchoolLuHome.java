package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.SchoolLu;

/**
 * This is the home interface for the SchoolLu class.
 * @see com.topcoder.web.TCES.ejb.SchoolLu
 * @author Phil Selby, May 22nd, 2002
 */

public interface SchoolLuHome extends javax.ejb.EJBHome {
	public SchoolLu create() throws RemoteException, CreateException;
}
