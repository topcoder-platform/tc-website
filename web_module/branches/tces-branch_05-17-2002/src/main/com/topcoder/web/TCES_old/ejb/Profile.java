package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileObject;

/**
 * This is the remote interface for the Profile class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface Profile extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param profile_id profile_id
	 * @param coder_id coder_id
	 * @param status_id status_id
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer profile_id, Integer coder_id, Integer status_id ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param profile_id profile_id
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer profile_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ProfileObject
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ProfileObject request( int cmd, ProfileObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the profile table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the coder_id field in the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param coder_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setCoderId( Integer profile_id, Integer coder_id ) throws RemoteException, SQLException;

	/**
	 * Get the coder_id field from the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getCoderId( Integer profile_id ) throws RemoteException, SQLException;

	/**
	 * Set the status_id field in the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param status_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setStatusId( Integer profile_id, Integer status_id ) throws RemoteException, SQLException;

	/**
	 * Get the status_id field from the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getStatusId( Integer profile_id ) throws RemoteException, SQLException;
}
