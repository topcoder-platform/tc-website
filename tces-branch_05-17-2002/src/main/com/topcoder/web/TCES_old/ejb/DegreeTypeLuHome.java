package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.DegreeTypeLu;

/**
 * This is the home interface for the DegreeTypeLu class.
 * @see com.topcoder.web.TCES.ejb.DegreeTypeLu
 * @author Phil Selby, May 22nd, 2002
 */

public interface DegreeTypeLuHome extends javax.ejb.EJBHome {
	public DegreeTypeLu create() throws RemoteException, CreateException;
}
