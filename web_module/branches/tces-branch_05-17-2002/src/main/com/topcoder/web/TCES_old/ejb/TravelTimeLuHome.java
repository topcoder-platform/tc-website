package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.TravelTimeLu;

/**
 * This is the home interface for the TravelTimeLu class.
 * @see com.topcoder.web.TCES.ejb.TravelTimeLu
 * @author Phil Selby, May 22nd, 2002
 */

public interface TravelTimeLuHome extends javax.ejb.EJBHome {
	public TravelTimeLu create() throws RemoteException, CreateException;
}
