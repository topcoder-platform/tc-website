package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Salary;

public interface SalaryHome extends javax.ejb.EJBHome {
	public Salary create() throws RemoteException, CreateException;
}
