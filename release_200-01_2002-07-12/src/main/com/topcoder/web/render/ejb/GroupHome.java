package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.Group;

public interface GroupHome extends javax.ejb.EJBHome {
	public Group create() throws RemoteException, CreateException;
}
