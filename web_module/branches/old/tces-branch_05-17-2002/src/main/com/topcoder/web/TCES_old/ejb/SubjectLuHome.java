package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.SubjectLu;

/**
 * This is the home interface for the SubjectLu class.
 * @see com.topcoder.web.TCES.ejb.SubjectLu
 * @author Phil Selby, May 22nd, 2002
 */

public interface SubjectLuHome extends javax.ejb.EJBHome {
	public SubjectLu create() throws RemoteException, CreateException;
}
