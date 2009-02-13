package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.TravelLevelLuObject;

/**
 * This is the remote interface for the TravelLevelLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface TravelLevelLu extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param travel_level_id travel_level_id
	 * @param travel_level_desc travel_level_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer travel_level_id, String travel_level_desc ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param travel_level_id travel_level_id
	 * @param travel_level_desc travel_level_desc
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Integer travel_level_id, String travel_level_desc ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param travel_level_id travel_level_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer travel_level_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.TravelLevelLuObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public TravelLevelLuObject request( int cmd, TravelLevelLuObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the travel_level_lu table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * List the content of the travel_level_lu table.
	 * @return a Hashtable containing the travel_level_ids as java.lang.Integer keys and travel_level_descs as java.lang.String values
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Hashtable listContent() throws RemoteException, SQLException;

	/**
	 * Set the travel_level_desc field in the travel_level_lu table corresponding to the given key.
	 * @param travel_level_id the table primary key
	 * @param travel_level_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setTravelLevelDesc( Integer travel_level_id, String travel_level_desc ) throws RemoteException, SQLException;

	/**
	 * Get the travel_level_desc field from the travel_level_lu table corresponding to the given key.
	 * @param travel_level_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getTravelLevelDesc( Integer travel_level_id ) throws RemoteException, SQLException;

}
