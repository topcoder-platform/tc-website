package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ConcentrationTypeLuObject;

/**
 * This is the remote interface for the ConcentrationTypeLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface ConcentrationTypeLu extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param concentration_type_id concentration_type_id
	 * @param concentration_type_desc concentration_type_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer concentration_type_id, String concentration_type_desc ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param concentration_type_id concentration_type_id
	 * @param concentration_type_desc concentration_type_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Integer concentration_type_id, String concentration_type_desc ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param concentration_type_id concentration_type_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer concentration_type_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ConcentrationTypeLuObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ConcentrationTypeLuObject request( int cmd, ConcentrationTypeLuObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the concentration_type_lu table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * List the content of the concentration_type_lu table.
	 * @return a Hashtable containing the concentration_type_ids as java.lang.Integer keys and concentration_type_descs as java.lang.String values
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Hashtable listContent() throws RemoteException, SQLException;

	/**
	 * Set the concentration_type_desc field in the concentration_type_lu table corresponding to the given key.
	 * @param concentration_type_id the table primary key
	 * @param concentration_type_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setConcentrationTypeDesc( Integer concentration_type_id, String concentration_type_desc ) throws RemoteException, SQLException;

	/**
	 * Get the concentration_type_desc field from the concentration_type_lu table corresponding to the given key.
	 * @param concentration_type_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getConcentrationTypeDesc( Integer concentration_type_id ) throws RemoteException, SQLException;

}
