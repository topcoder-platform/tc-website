package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.WebContentGroup;

public interface WebContentGroupHome extends javax.ejb.EJBHome {
	public WebContentGroup create() throws RemoteException, CreateException;
}
