package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileEducation;

/**
 * This is the home interface for the ProfileEducation class.
 * @see com.topcoder.web.TCES.ejb.ProfileEducation
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileEducationHome extends javax.ejb.EJBHome {
	public ProfileEducation create() throws RemoteException, CreateException;
}
