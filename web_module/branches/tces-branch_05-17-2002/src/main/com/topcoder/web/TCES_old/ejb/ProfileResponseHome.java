package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileResponse;

public interface ProfileResponseHome extends javax.ejb.EJBHome {
	public ProfileResponse create() throws RemoteException, CreateException;
}
