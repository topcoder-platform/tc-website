package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Salary;

/**
 * This is the home interface for the Salary class.
 * @see com.topcoder.web.TCES.ejb.Salary
 * @author Phil Selby, May 22nd, 2002
 */

public interface SalaryHome extends javax.ejb.EJBHome {
	public Salary create() throws RemoteException, CreateException;
}
