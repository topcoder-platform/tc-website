package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.DegreeType;

/**
 * This is the home interface for the DegreeType class.
 * @see com.topcoder.web.TCES.ejb.DegreeType
 * @author Phil Selby, May 22nd, 2002
 */

public interface DegreeTypeHome extends javax.ejb.EJBHome {
	public DegreeType create() throws RemoteException, CreateException;
}
