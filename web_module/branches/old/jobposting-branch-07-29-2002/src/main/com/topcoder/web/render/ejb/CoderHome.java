package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.Coder;

public interface CoderHome extends javax.ejb.EJBHome {
	public Coder create() throws RemoteException, CreateException;
}
