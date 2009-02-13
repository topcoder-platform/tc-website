package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.WebMenuPath;

public interface WebMenuPathHome extends javax.ejb.EJBHome {
	public WebMenuPath create() throws RemoteException, CreateException;
}
