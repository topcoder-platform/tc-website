package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Industry;

public interface IndustryHome extends javax.ejb.EJBHome {
	public Industry create() throws RemoteException, CreateException;
}
