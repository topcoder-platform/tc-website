package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.IndustryLuObject;

/**
 * This is the remote interface for the IndustryLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface IndustryLu extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param industry_id industry_id
	 * @param industry_desc industry_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer industry_id, String industry_desc ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param industry_id industry_id
	 * @param industry_desc industry_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Integer industry_id, String industry_desc ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param industry_id industry_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer industry_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.IndustryLuObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public IndustryLuObject request( int cmd, IndustryLuObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the industry_lu table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * List the content of the industry_lu table.
	 * @return a Hashtable containing the industry_ids as java.lang.Integer keys and industry_descs as java.lang.String values
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Hashtable listContent() throws RemoteException, SQLException;

	/**
	 * Set the industry_desc field in the industry_lu table corresponding to the given key.
	 * @param industry_id the table primary key
	 * @param industry_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setIndustryDesc( Integer industry_id, String industry_desc ) throws RemoteException, SQLException;

	/**
	 * Get the industry_desc field from the industry_lu table corresponding to the given key.
	 * @param industry_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getIndustryDesc( Integer industry_id ) throws RemoteException, SQLException;

}
