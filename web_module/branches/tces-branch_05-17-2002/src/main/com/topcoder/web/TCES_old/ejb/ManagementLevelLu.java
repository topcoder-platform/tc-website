package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ManagementLevelLuObject;

/**
 * This is the remote interface for the ManagementLevelLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface ManagementLevelLu extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param management_level_id management_level_id
	 * @param management_level_desc management_level_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer management_level_id, String management_level_desc ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param management_level_id management_level_id
	 * @param management_level_desc management_level_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Integer management_level_id, String management_level_desc ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param management_level_id management_level_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer management_level_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ManagementLevelLuObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ManagementLevelLuObject request( int cmd, ManagementLevelLuObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the management_level_lu table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * List the content of the management_level_lu table.
	 * @return a Hashtable containing the management_level_ids as java.lang.Integer keys and management_level_descs as java.lang.String values
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Hashtable listContent() throws RemoteException, SQLException;

	/**
	 * Set the management_level_desc field in the management_level_lu table corresponding to the given key.
	 * @param management_level_id the table primary key
	 * @param management_level_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setManagementLevelDesc( Integer management_level_id, String management_level_desc ) throws RemoteException, SQLException;

	/**
	 * Get the management_level_desc field from the management_level_lu table corresponding to the given key.
	 * @param management_level_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getManagementLevelDesc( Integer management_level_id ) throws RemoteException, SQLException;

}
