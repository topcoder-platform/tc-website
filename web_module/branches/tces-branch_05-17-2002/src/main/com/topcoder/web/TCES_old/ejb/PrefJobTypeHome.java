package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefJobType;

public interface PrefJobTypeHome extends javax.ejb.EJBHome {
	public PrefJobType create() throws RemoteException, CreateException;
}
