package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ConcentrationTypeLu;

/**
 * This is the home interface for the ConcentrationTypeLu class.
 * @see com.topcoder.web.TCES.ejb.ConcentrationTypeLu
 * @author Phil Selby, May 22nd, 2002
 */

public interface ConcentrationTypeLuHome extends javax.ejb.EJBHome {
	public ConcentrationTypeLu create() throws RemoteException, CreateException;
}
