package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.OrganizationSizeLuObject;

/**
 * This is the remote interface for the OrganizationSizeLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface OrganizationSizeLu extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param organization_size_id organization_size_id
	 * @param organization_size_desc organization_size_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer organization_size_id, String organization_size_desc ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param organization_size_id organization_size_id
	 * @param organization_size_desc organization_size_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Integer organization_size_id, String organization_size_desc ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param organization_size_id organization_size_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer organization_size_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.OrganizationSizeLuObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public OrganizationSizeLuObject request( int cmd, OrganizationSizeLuObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the organization_size_lu table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * List the content of the organization_size_lu table.
	 * @return a Hashtable containing the organization_size_ids as java.lang.Integer keys and organization_size_descs as java.lang.String values
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Hashtable listContent() throws RemoteException, SQLException;

	/**
	 * Set the organization_size_desc field in the organization_size_lu table corresponding to the given key.
	 * @param organization_size_id the table primary key
	 * @param organization_size_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setOrganizationSizeDesc( Integer organization_size_id, String organization_size_desc ) throws RemoteException, SQLException;

	/**
	 * Get the organization_size_desc field from the organization_size_lu table corresponding to the given key.
	 * @param organization_size_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getOrganizationSizeDesc( Integer organization_size_id ) throws RemoteException, SQLException;

}
