package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileQuestion;

/**
 * This is the home interface for the ProfileQuestion class.
 * @see com.topcoder.web.TCES.ejb.ProfileQuestion
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileQuestionHome extends javax.ejb.EJBHome {
	public ProfileQuestion create() throws RemoteException, CreateException;
}
