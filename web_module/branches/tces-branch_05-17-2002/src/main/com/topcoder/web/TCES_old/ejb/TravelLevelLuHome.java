package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.TravelLevelLu;

/**
 * This is the home interface for the TravelLevelLu class.
 * @see com.topcoder.web.TCES.ejb.TravelLevelLu
 * @author Phil Selby, May 22nd, 2002
 */

public interface TravelLevelLuHome extends javax.ejb.EJBHome {
	public TravelLevelLu create() throws RemoteException, CreateException;
}
