package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.Permission;

public interface PermissionHome extends javax.ejb.EJBHome {
	public Permission create() throws RemoteException, CreateException;
}
