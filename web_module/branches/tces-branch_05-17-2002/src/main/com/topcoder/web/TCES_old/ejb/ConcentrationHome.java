package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Concentration;

public interface ConcentrationHome extends javax.ejb.EJBHome {
	public Concentration create() throws RemoteException, CreateException;
}
