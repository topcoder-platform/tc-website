package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.WebPage;

public interface WebPageHome extends javax.ejb.EJBHome {
	public WebPage create() throws RemoteException, CreateException;
}
