package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.UserObject;

/**
 * This is the remote interface for the User class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface User extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param user_id user_id
	 * @param handle handle
	 * @param password password
	 * @param status status
	 * @param user_type_id user_type_id
	 * @param email email
	 * @param logged_in logged_in
	 * @param terms terms
	 * @param last_login last_login
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Long user_id, String handle, String password, String status, Integer user_type_id, String email, String logged_in, String terms, Date last_login ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param user_id user_id
	 * @param handle handle
	 * @param password password
	 * @param status status
	 * @param user_type_id user_type_id
	 * @param email email
	 * @param logged_in logged_in
	 * @param terms terms
	 * @param last_login last_login
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Long user_id, String handle, String password, String status, Integer user_type_id, String email, String logged_in, String terms, Date last_login ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param user_id user_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Long user_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.UserObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public UserObject request( int cmd, UserObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the user table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the handle field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param handle the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setHandle( Long user_id, String handle ) throws RemoteException, SQLException;

	/**
	 * Get the handle field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getHandle( Long user_id ) throws RemoteException, SQLException;

	/**
	 * Set the password field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param password the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setPassword( Long user_id, String password ) throws RemoteException, SQLException;

	/**
	 * Get the password field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getPassword( Long user_id ) throws RemoteException, SQLException;

	/**
	 * Set the status field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param status the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setStatus( Long user_id, String status ) throws RemoteException, SQLException;

	/**
	 * Get the status field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getStatus( Long user_id ) throws RemoteException, SQLException;

	/**
	 * Set the user_type_id field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param user_type_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setUserTypeId( Long user_id, Integer user_type_id ) throws RemoteException, SQLException;

	/**
	 * Get the user_type_id field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getUserTypeId( Long user_id ) throws RemoteException, SQLException;

	/**
	 * Set the email field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param email the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setEmail( Long user_id, String email ) throws RemoteException, SQLException;

	/**
	 * Get the email field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getEmail( Long user_id ) throws RemoteException, SQLException;

	/**
	 * Set the logged_in field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param logged_in the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setLoggedIn( Long user_id, String logged_in ) throws RemoteException, SQLException;

	/**
	 * Get the logged_in field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getLoggedIn( Long user_id ) throws RemoteException, SQLException;

	/**
	 * Set the terms field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param terms the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setTerms( Long user_id, String terms ) throws RemoteException, SQLException;

	/**
	 * Get the terms field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getTerms( Long user_id ) throws RemoteException, SQLException;

	/**
	 * Set the last_login field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param last_login the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setLastLogin( Long user_id, Date last_login ) throws RemoteException, SQLException;

	/**
	 * Get the last_login field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getLastLogin( Long user_id ) throws RemoteException, SQLException;

}
