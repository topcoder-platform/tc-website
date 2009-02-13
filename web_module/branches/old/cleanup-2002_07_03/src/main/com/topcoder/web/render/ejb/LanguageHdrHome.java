package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.LanguageHdr;

public interface LanguageHdrHome extends javax.ejb.EJBHome {
	public LanguageHdr create() throws RemoteException, CreateException;
}
