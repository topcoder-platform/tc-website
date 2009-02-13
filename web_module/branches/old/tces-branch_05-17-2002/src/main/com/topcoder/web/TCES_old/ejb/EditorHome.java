package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Editor;

/**
 * This is the home interface for the Editor class.
 * @see com.topcoder.web.TCES.ejb.Editor
 * @author Phil Selby, May 22nd, 2002
 */

public interface EditorHome extends javax.ejb.EJBHome {
	public Editor create() throws RemoteException, CreateException;
}
