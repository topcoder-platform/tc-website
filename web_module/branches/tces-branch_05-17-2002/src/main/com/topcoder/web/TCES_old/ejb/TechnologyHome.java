package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Technology;

public interface TechnologyHome extends javax.ejb.EJBHome {
	public Technology create() throws RemoteException, CreateException;
}
