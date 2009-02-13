package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.GpaObject;

/**
 * This is the remote interface for the Gpa class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface Gpa extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param gpa_id gpa_id
	 * @param gpa_type_id gpa_type_id
	 * @param gpa_desc gpa_desc
	 * @param gpa_value gpa_value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer gpa_id, Integer gpa_type_id, String gpa_desc, Integer gpa_value ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param gpa_id gpa_id
	 * @param gpa_type_id gpa_type_id
	 * @param gpa_desc gpa_desc
	 * @param gpa_value gpa_value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Integer gpa_id, Integer gpa_type_id, String gpa_desc, Integer gpa_value ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param gpa_id gpa_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer gpa_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.GpaObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public GpaObject request( int cmd, GpaObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the gpa table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the gpa_type_id field in the gpa table corresponding to the given key.
	 * @param gpa_id the table primary key
	 * @param gpa_type_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setGpaTypeId( Integer gpa_id, Integer gpa_type_id ) throws RemoteException, SQLException;

	/**
	 * Get the gpa_type_id field from the gpa table corresponding to the given key.
	 * @param gpa_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getGpaTypeId( Integer gpa_id ) throws RemoteException, SQLException;

	/**
	 * Set the gpa_desc field in the gpa table corresponding to the given key.
	 * @param gpa_id the table primary key
	 * @param gpa_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setGpaDesc( Integer gpa_id, String gpa_desc ) throws RemoteException, SQLException;

	/**
	 * Get the gpa_desc field from the gpa table corresponding to the given key.
	 * @param gpa_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getGpaDesc( Integer gpa_id ) throws RemoteException, SQLException;

	/**
	 * Set the gpa_value field in the gpa table corresponding to the given key.
	 * @param gpa_id the table primary key
	 * @param gpa_value the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setGpaValue( Integer gpa_id, Integer gpa_value ) throws RemoteException, SQLException;

	/**
	 * Get the gpa_value field from the gpa table corresponding to the given key.
	 * @param gpa_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getGpaValue( Integer gpa_id ) throws RemoteException, SQLException;

}
