package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Subject;

public interface SubjectHome extends javax.ejb.EJBHome {
	public Subject create() throws RemoteException, CreateException;
}
