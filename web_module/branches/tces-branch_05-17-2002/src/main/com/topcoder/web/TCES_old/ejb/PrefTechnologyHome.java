package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefTechnology;

public interface PrefTechnologyHome extends javax.ejb.EJBHome {
	public PrefTechnology create() throws RemoteException, CreateException;
}
