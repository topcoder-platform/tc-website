package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.School;

public interface SchoolHome extends javax.ejb.EJBHome {
	public School create() throws RemoteException, CreateException;
}
