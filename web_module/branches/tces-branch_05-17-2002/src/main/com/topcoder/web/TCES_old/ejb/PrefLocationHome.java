package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefLocation;

public interface PrefLocationHome extends javax.ejb.EJBHome {
	public PrefLocation create() throws RemoteException, CreateException;
}
