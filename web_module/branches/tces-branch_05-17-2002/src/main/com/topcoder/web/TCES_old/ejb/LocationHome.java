package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Location;

public interface LocationHome extends javax.ejb.EJBHome {
	public Location create() throws RemoteException, CreateException;
}
