package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.WebContent;

public interface WebContentHome extends javax.ejb.EJBHome {
	public WebContent create() throws RemoteException, CreateException;
}
