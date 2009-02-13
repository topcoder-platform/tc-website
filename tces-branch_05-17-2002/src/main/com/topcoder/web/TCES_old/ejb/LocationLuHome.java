package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.LocationLu;

/**
 * This is the home interface for the LocationLu class.
 * @see com.topcoder.web.TCES.ejb.LocationLu
 * @author Phil Selby, May 22nd, 2002
 */

public interface LocationLuHome extends javax.ejb.EJBHome {
	public LocationLu create() throws RemoteException, CreateException;
}
