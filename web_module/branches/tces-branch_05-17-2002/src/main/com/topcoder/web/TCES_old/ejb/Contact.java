package	com.topcoder.web.TCES.ejb;

import	java.sql.SQLException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.common.Lookup;

/**
 * This is the remote interface for the Contact class.
 * @author Phil Selby, June 12th, 2002
 */

public interface Contact extends javax.ejb.EJBObject {
	public Lookup getStateList() throws RemoteException, SQLException;
	public Lookup getCountryList() throws RemoteException, SQLException;
}
