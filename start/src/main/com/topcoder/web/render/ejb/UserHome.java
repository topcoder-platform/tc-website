package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.User;

public interface UserHome extends javax.ejb.EJBHome {
	public User create() throws RemoteException, CreateException;
}
