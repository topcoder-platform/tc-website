package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.WebMenuType;

public interface WebMenuTypeHome extends javax.ejb.EJBHome {
	public WebMenuType create() throws RemoteException, CreateException;
}
