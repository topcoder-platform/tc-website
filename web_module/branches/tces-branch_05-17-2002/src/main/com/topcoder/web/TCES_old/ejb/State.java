package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.StateObject;
import	com.topcoder.web.TCES.common.Lookup;

/**
 * This is the remote interface for the State class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface State extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param state_code state_code
	 * @param state_name state_name
	 * @param region_code region_code
	 * @param demographic_decline demographic_decline
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( String state_code, String state_name, String region_code, Integer demographic_decline ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param state_code state_code
	 * @param state_name state_name
	 * @param region_code region_code
	 * @param demographic_decline demographic_decline
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, String state_code, String state_name, String region_code, Integer demographic_decline ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param state_code state_code
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( String state_code ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.StateObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public StateObject request( int cmd, StateObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the state table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the state_name field in the state table corresponding to the given key.
	 * @param state_code the table primary key
	 * @param state_name the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setStateName( String state_code, String state_name ) throws RemoteException, SQLException;

	/**
	 * Get the state_name field from the state table corresponding to the given key.
	 * @param state_code the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getStateName( String state_code ) throws RemoteException, SQLException;

	/**
	 * Set the region_code field in the state table corresponding to the given key.
	 * @param state_code the table primary key
	 * @param region_code the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setRegionCode( String state_code, String region_code ) throws RemoteException, SQLException;

	/**
	 * Get the region_code field from the state table corresponding to the given key.
	 * @param state_code the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getRegionCode( String state_code ) throws RemoteException, SQLException;

	/**
	 * Set the demographic_decline field in the state table corresponding to the given key.
	 * @param state_code the table primary key
	 * @param demographic_decline the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDemographicDecline( String state_code, Integer demographic_decline ) throws RemoteException, SQLException;

	/**
	 * Get the demographic_decline field from the state table corresponding to the given key.
	 * @param state_code the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getDemographicDecline( String state_code ) throws RemoteException, SQLException;

	public Lookup listStateCodeStateName() throws RemoteException, SQLException;
}
