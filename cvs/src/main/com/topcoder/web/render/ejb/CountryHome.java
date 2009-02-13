package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.Country;

public interface CountryHome extends javax.ejb.EJBHome {
	public Country create() throws RemoteException, CreateException;
}
