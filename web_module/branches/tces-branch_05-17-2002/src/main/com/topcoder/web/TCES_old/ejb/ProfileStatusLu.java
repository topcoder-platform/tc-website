package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileStatusLuObject;

/**
 * This is the remote interface for the ProfileStatusLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileStatusLu extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param profile_status_id profile_status_id
	 * @param profile_status_desc profile_status_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer profile_status_id, String profile_status_desc ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param profile_status_id profile_status_id
	 * @param profile_status_desc profile_status_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Integer profile_status_id, String profile_status_desc ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param profile_status_id profile_status_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer profile_status_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ProfileStatusLuObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ProfileStatusLuObject request( int cmd, ProfileStatusLuObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the profile_status_lu table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * List the content of the profile_status_lu table.
	 * @return a Hashtable containing the profile_status_ids as java.lang.Integer keys and profile_status_descs as java.lang.String values
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Hashtable listContent() throws RemoteException, SQLException;

	/**
	 * Set the profile_status_desc field in the profile_status_lu table corresponding to the given key.
	 * @param profile_status_id the table primary key
	 * @param profile_status_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileStatusDesc( Integer profile_status_id, String profile_status_desc ) throws RemoteException, SQLException;

	/**
	 * Get the profile_status_desc field from the profile_status_lu table corresponding to the given key.
	 * @param profile_status_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getProfileStatusDesc( Integer profile_status_id ) throws RemoteException, SQLException;

}
