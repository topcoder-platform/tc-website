package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.LanguageObject;
import	com.topcoder.web.TCES.common.Lookup;

/**
 * This is the remote interface for the Language class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface Language extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param language_id language_id
	 * @param language_name language_name
	 * @param status status
	 * @param language_desc language_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer language_id, String language_name, String status, String language_desc ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param language_id language_id
	 * @param language_name language_name
	 * @param status status
	 * @param language_desc language_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Integer language_id, String language_name, String status, String language_desc ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param language_id language_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer language_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.LanguageObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public LanguageObject request( int cmd, LanguageObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the language table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the language_name field in the language table corresponding to the given key.
	 * @param language_id the table primary key
	 * @param language_name the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setLanguageName( Integer language_id, String language_name ) throws RemoteException, SQLException;

	/**
	 * Get the language_name field from the language table corresponding to the given key.
	 * @param language_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getLanguageName( Integer language_id ) throws RemoteException, SQLException;

	/**
	 * Set the status field in the language table corresponding to the given key.
	 * @param language_id the table primary key
	 * @param status the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setStatus( Integer language_id, String status ) throws RemoteException, SQLException;

	/**
	 * Get the status field from the language table corresponding to the given key.
	 * @param language_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getStatus( Integer language_id ) throws RemoteException, SQLException;

	/**
	 * Set the language_desc field in the language table corresponding to the given key.
	 * @param language_id the table primary key
	 * @param language_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setLanguageDesc( Integer language_id, String language_desc ) throws RemoteException, SQLException;

	/**
	 * Get the language_desc field from the language table corresponding to the given key.
	 * @param language_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getLanguageDesc( Integer language_id ) throws RemoteException, SQLException;

	public Lookup listLanguageIdLanguageName() throws RemoteException, SQLException;
}
