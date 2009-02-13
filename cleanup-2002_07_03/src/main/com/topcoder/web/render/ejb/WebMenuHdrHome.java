package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.WebMenuHdr;

public interface WebMenuHdrHome extends javax.ejb.EJBHome {
	public WebMenuHdr create() throws RemoteException, CreateException;
}
