package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.Sector;

public interface SectorHome extends javax.ejb.EJBHome {
	public Sector create() throws RemoteException, CreateException;
}
