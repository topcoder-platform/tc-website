package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ConcentrationType;

public interface ConcentrationTypeHome extends javax.ejb.EJBHome {
	public ConcentrationType create() throws RemoteException, CreateException;
}
