package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Language;

/**
 * This is the home interface for the Language class.
 * @see com.topcoder.web.TCES.ejb.Language
 * @author Phil Selby, May 22nd, 2002
 */

public interface LanguageHome extends javax.ejb.EJBHome {
	public Language create() throws RemoteException, CreateException;
}
