package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.SectorAccess;

public interface SectorAccessHome extends javax.ejb.EJBHome {
	public SectorAccess create() throws RemoteException, CreateException;
}
