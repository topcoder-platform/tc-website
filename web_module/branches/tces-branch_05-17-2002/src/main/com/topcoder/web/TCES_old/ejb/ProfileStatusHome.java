package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileStatus;

public interface ProfileStatusHome extends javax.ejb.EJBHome {
	public ProfileStatus create() throws RemoteException, CreateException;
}
