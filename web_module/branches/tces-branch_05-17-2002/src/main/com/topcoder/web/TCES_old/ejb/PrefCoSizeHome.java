package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefCoSize;

public interface PrefCoSizeHome extends javax.ejb.EJBHome {
	public PrefCoSize create() throws RemoteException, CreateException;
}
