package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.WebStatus;

public interface WebStatusHome extends javax.ejb.EJBHome {
	public WebStatus create() throws RemoteException, CreateException;
}
