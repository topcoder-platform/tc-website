package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.SecureObject;

public interface SecureObjectHome extends javax.ejb.EJBHome {
	public SecureObject create() throws RemoteException, CreateException;
}
