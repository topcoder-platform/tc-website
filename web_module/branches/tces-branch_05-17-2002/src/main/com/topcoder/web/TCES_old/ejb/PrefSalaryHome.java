package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefSalary;

public interface PrefSalaryHome extends javax.ejb.EJBHome {
	public PrefSalary create() throws RemoteException, CreateException;
}
