package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ExpTechnology;

public interface ExpTechnologyHome extends javax.ejb.EJBHome {
	public ExpTechnology create() throws RemoteException, CreateException;
}
