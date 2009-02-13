package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.OrganizationSizeLu;

/**
 * This is the home interface for the OrganizationSizeLu class.
 * @see com.topcoder.web.TCES.ejb.OrganizationSizeLu
 * @author Phil Selby, May 22nd, 2002
 */

public interface OrganizationSizeLuHome extends javax.ejb.EJBHome {
	public OrganizationSizeLu create() throws RemoteException, CreateException;
}
