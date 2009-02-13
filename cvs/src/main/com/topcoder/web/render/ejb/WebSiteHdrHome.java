package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.WebSiteHdr;

public interface WebSiteHdrHome extends javax.ejb.EJBHome {
	public WebSiteHdr create() throws RemoteException, CreateException;
}
