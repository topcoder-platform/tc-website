package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PreferenceIndustryXrefObject;

/**
 * This is the remote interface for the PreferenceIndustryXref class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface PreferenceIndustryXref extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param profile_id profile_id
	 * @param industry_id industry_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Long profile_id, Integer industry_id ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param profile_id profile_id
	 * @param industry_id industry_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Long profile_id, Integer industry_id ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param profile_id profile_id
	 * @param industry_id industry_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Long profile_id, Integer industry_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.PreferenceIndustryXrefObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public PreferenceIndustryXrefObject request( int cmd, PreferenceIndustryXrefObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the preference_industry_xref table.
	 * @return a Hashtable containing the concatenated keys,
	 * @return a Hashtable containing the profile_ids as java.lang.Long keys and industry_ids as java.lang.Integer values
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Hashtable list() throws RemoteException, SQLException;

}
