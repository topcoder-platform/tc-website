package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileAnswer;

/**
 * This is the home interface for the ProfileAnswer class.
 * @see com.topcoder.web.TCES.ejb.ProfileAnswer
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileAnswerHome extends javax.ejb.EJBHome {
	public ProfileAnswer create() throws RemoteException, CreateException;
}
