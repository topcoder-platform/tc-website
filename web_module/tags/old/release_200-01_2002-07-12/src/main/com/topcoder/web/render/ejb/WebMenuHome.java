package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.WebMenu;

public interface WebMenuHome extends javax.ejb.EJBHome {
	public WebMenu create() throws RemoteException, CreateException;
}
