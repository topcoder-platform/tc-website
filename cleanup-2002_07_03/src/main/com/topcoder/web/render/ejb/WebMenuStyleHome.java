package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.WebMenuStyle;

public interface WebMenuStyleHome extends javax.ejb.EJBHome {
	public WebMenuStyle create() throws RemoteException, CreateException;
}
