package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.GroupUser;

public interface GroupUserHome extends javax.ejb.EJBHome {
	public GroupUser create() throws RemoteException, CreateException;
}
