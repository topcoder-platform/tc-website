package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefIndustry;

/**
 * This is the home interface for the PrefIndustry class.
 * @see com.topcoder.web.TCES.ejb.PrefIndustry
 * @author Phil Selby, May 22nd, 2002
 */

public interface PrefIndustryHome extends javax.ejb.EJBHome {
	public PrefIndustry create() throws RemoteException, CreateException;
}
