package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefJobTypeObject;

/**
 * This is the remote interface for the PrefJobType class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface PrefJobType extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param profile_id profile_id
	 * @param job_type_id job_type_id
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer profile_id, Integer job_type_id ) throws RemoteException, SQLException;

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
	 * @see com.topcoder.web.TCES.ejb.PrefJobTypeObject
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public PrefJobTypeObject request( int cmd, PrefJobTypeObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the pref_job_type table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;
	public String findByJobTypeId( Integer job_type_id ) throws RemoteException, SQLException;

	/**
	 * Set the job_type_id field in the pref_job_type table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param job_type_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setJobTypeId( Integer profile_id, Integer job_type_id ) throws RemoteException, SQLException;

	/**
	 * Get the job_type_id field from the pref_job_type table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getJobTypeId( Integer profile_id ) throws RemoteException, SQLException;
}
