package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefIndustryObject;

/**
 * This is the remote interface for the PrefIndustry class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface PrefIndustry extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param profile_id profile_id
	 * @param industry_id industry_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer profile_id, Integer industry_id ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param profile_id profile_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer profile_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.PrefIndustryObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public PrefIndustryObject request( int cmd, PrefIndustryObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the pref_industry table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;
	public String findByIndustryId( Integer industry_id ) throws RemoteException, SQLException;

	/**
	 * Set the industry_id field in the pref_industry table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param industry_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setIndustryId( Integer profile_id, Integer industry_id ) throws RemoteException, SQLException;

	/**
	 * Get the industry_id field from the pref_industry table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getIndustryId( Integer profile_id ) throws RemoteException, SQLException;
}
