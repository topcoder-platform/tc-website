package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.WebFile;

public interface WebFileHome extends javax.ejb.EJBHome {
	public WebFile create() throws RemoteException, CreateException;
}
