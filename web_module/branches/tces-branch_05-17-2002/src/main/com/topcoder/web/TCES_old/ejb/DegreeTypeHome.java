package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.DegreeType;

public interface DegreeTypeHome extends javax.ejb.EJBHome {
	public DegreeType create() throws RemoteException, CreateException;
}
