package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.SectorFile;

public interface SectorFileHome extends javax.ejb.EJBHome {
	public SectorFile create() throws RemoteException, CreateException;
}
