package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefSalary;

/**
 * This is the home interface for the PrefSalary class.
 * @see com.topcoder.web.TCES.ejb.PrefSalary
 * @author Phil Selby, May 22nd, 2002
 */

public interface PrefSalaryHome extends javax.ejb.EJBHome {
	public PrefSalary create() throws RemoteException, CreateException;
}
