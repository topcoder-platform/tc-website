package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefJobRoleObject;

/**
 * This is the remote interface for the PrefJobRole class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface PrefJobRole extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param profile_id profile_id
	 * @param job_role_id job_role_id
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer profile_id, Integer job_role_id ) throws RemoteException, SQLException;

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
	 * @see com.topcoder.web.TCES.ejb.PrefJobRoleObject
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public PrefJobRoleObject request( int cmd, PrefJobRoleObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the pref_job_role table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;
	public String findByJobRoleId( Integer job_role_id ) throws RemoteException, SQLException;

	/**
	 * Set the job_role_id field in the pref_job_role table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param job_role_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setJobRoleId( Integer profile_id, Integer job_role_id ) throws RemoteException, SQLException;

	/**
	 * Get the job_role_id field from the pref_job_role table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getJobRoleId( Integer profile_id ) throws RemoteException, SQLException;
}
