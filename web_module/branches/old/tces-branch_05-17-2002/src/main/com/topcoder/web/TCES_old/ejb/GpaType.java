package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.GpaTypeObject;

/**
 * This is the remote interface for the GpaType class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface GpaType extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param gpa_type_id gpa_type_id
	 * @param gpa_type_desc gpa_type_desc
	 * @param gpa_type_value gpa_type_value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer gpa_type_id, String gpa_type_desc, Integer gpa_type_value ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param gpa_type_id gpa_type_id
	 * @param gpa_type_desc gpa_type_desc
	 * @param gpa_type_value gpa_type_value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Integer gpa_type_id, String gpa_type_desc, Integer gpa_type_value ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param gpa_type_id gpa_type_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer gpa_type_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.GpaTypeObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public GpaTypeObject request( int cmd, GpaTypeObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the gpa_type table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the gpa_type_desc field in the gpa_type table corresponding to the given key.
	 * @param gpa_type_id the table primary key
	 * @param gpa_type_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setGpaTypeDesc( Integer gpa_type_id, String gpa_type_desc ) throws RemoteException, SQLException;

	/**
	 * Get the gpa_type_desc field from the gpa_type table corresponding to the given key.
	 * @param gpa_type_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getGpaTypeDesc( Integer gpa_type_id ) throws RemoteException, SQLException;

	/**
	 * Set the gpa_type_value field in the gpa_type table corresponding to the given key.
	 * @param gpa_type_id the table primary key
	 * @param gpa_type_value the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setGpaTypeValue( Integer gpa_type_id, Integer gpa_type_value ) throws RemoteException, SQLException;

	/**
	 * Get the gpa_type_value field from the gpa_type table corresponding to the given key.
	 * @param gpa_type_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getGpaTypeValue( Integer gpa_type_id ) throws RemoteException, SQLException;

}
