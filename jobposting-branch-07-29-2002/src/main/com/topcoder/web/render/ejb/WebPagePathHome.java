package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.WebPagePath;

public interface WebPagePathHome extends javax.ejb.EJBHome {
	public WebPagePath create() throws RemoteException, CreateException;
}
