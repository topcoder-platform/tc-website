package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.SalaryLu;

/**
 * This is the home interface for the SalaryLu class.
 * @see com.topcoder.web.TCES.ejb.SalaryLu
 * @author Phil Selby, May 22nd, 2002
 */

public interface SalaryLuHome extends javax.ejb.EJBHome {
	public SalaryLu create() throws RemoteException, CreateException;
}
