package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Profile;

public interface ProfileHome extends javax.ejb.EJBHome {
	public Profile create() throws RemoteException, CreateException;
}
