package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.CoSize;

public interface CoSizeHome extends javax.ejb.EJBHome {
	public CoSize create() throws RemoteException, CreateException;
}
