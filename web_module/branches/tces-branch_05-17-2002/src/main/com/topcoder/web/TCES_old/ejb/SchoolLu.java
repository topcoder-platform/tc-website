package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.SchoolLuObject;

/**
 * This is the remote interface for the SchoolLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface SchoolLu extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param school_id school_id
	 * @param name name
	 * @param location location
	 * @param profile_id profile_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer school_id, String name, String location, Long profile_id ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param school_id school_id
	 * @param name name
	 * @param location location
	 * @param profile_id profile_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Integer school_id, String name, String location, Long profile_id ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param school_id school_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer school_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.SchoolLuObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public SchoolLuObject request( int cmd, SchoolLuObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the school_lu table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the name field in the school_lu table corresponding to the given key.
	 * @param school_id the table primary key
	 * @param name the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setName( Integer school_id, String name ) throws RemoteException, SQLException;

	/**
	 * Get the name field from the school_lu table corresponding to the given key.
	 * @param school_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getName( Integer school_id ) throws RemoteException, SQLException;

	/**
	 * Set the location field in the school_lu table corresponding to the given key.
	 * @param school_id the table primary key
	 * @param location the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setLocation( Integer school_id, String location ) throws RemoteException, SQLException;

	/**
	 * Get the location field from the school_lu table corresponding to the given key.
	 * @param school_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getLocation( Integer school_id ) throws RemoteException, SQLException;

	/**
	 * Set the profile_id field in the school_lu table corresponding to the given key.
	 * @param school_id the table primary key
	 * @param profile_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileId( Integer school_id, Long profile_id ) throws RemoteException, SQLException;

	/**
	 * Get the profile_id field from the school_lu table corresponding to the given key.
	 * @param school_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Long getProfileId( Integer school_id ) throws RemoteException, SQLException;
}
