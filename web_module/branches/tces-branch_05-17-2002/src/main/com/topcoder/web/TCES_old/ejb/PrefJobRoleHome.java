package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefJobRole;

public interface PrefJobRoleHome extends javax.ejb.EJBHome {
	public PrefJobRole create() throws RemoteException, CreateException;
}
