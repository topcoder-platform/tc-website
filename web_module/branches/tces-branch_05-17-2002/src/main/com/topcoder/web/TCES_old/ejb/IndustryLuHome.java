package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.IndustryLu;

/**
 * This is the home interface for the IndustryLu class.
 * @see com.topcoder.web.TCES.ejb.IndustryLu
 * @author Phil Selby, May 22nd, 2002
 */

public interface IndustryLuHome extends javax.ejb.EJBHome {
	public IndustryLu create() throws RemoteException, CreateException;
}
