package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.Access;

public interface AccessHome extends javax.ejb.EJBHome {
	public Access create() throws RemoteException, CreateException;
}
