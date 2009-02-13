package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.DegreeTypeLuObject;

/**
 * This is the remote interface for the DegreeTypeLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface DegreeTypeLu extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param degree_type_id degree_type_id
	 * @param degree_type_desc degree_type_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer degree_type_id, String degree_type_desc ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param degree_type_id degree_type_id
	 * @param degree_type_desc degree_type_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Integer degree_type_id, String degree_type_desc ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param degree_type_id degree_type_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer degree_type_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.DegreeTypeLuObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public DegreeTypeLuObject request( int cmd, DegreeTypeLuObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the degree_type_lu table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * List the content of the degree_type_lu table.
	 * @return a Hashtable containing the degree_type_ids as java.lang.Integer keys and degree_type_descs as java.lang.String values
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Hashtable listContent() throws RemoteException, SQLException;

	/**
	 * Set the degree_type_desc field in the degree_type_lu table corresponding to the given key.
	 * @param degree_type_id the table primary key
	 * @param degree_type_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDegreeTypeDesc( Integer degree_type_id, String degree_type_desc ) throws RemoteException, SQLException;

	/**
	 * Get the degree_type_desc field from the degree_type_lu table corresponding to the given key.
	 * @param degree_type_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getDegreeTypeDesc( Integer degree_type_id ) throws RemoteException, SQLException;

}
