package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefIndustry;

public interface PrefIndustryHome extends javax.ejb.EJBHome {
	public PrefIndustry create() throws RemoteException, CreateException;
}
