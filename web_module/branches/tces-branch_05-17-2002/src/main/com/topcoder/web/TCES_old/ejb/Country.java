package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.CountryObject;
import	com.topcoder.web.TCES.common.Lookup;

/**
 * This is the remote interface for the Country class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface Country extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param country_code country_code
	 * @param country_name country_name
	 * @param participating participating
	 * @param default_taxform_id default_taxform_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( String country_code, String country_name, Integer participating, Long default_taxform_id ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param country_code country_code
	 * @param country_name country_name
	 * @param participating participating
	 * @param default_taxform_id default_taxform_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, String country_code, String country_name, Integer participating, Long default_taxform_id ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param country_code country_code
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( String country_code ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.CountryObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public CountryObject request( int cmd, CountryObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the country table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the country_name field in the country table corresponding to the given key.
	 * @param country_code the table primary key
	 * @param country_name the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setCountryName( String country_code, String country_name ) throws RemoteException, SQLException;

	/**
	 * Get the country_name field from the country table corresponding to the given key.
	 * @param country_code the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getCountryName( String country_code ) throws RemoteException, SQLException;

	/**
	 * Set the participating field in the country table corresponding to the given key.
	 * @param country_code the table primary key
	 * @param participating the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setParticipating( String country_code, Integer participating ) throws RemoteException, SQLException;

	/**
	 * Get the participating field from the country table corresponding to the given key.
	 * @param country_code the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getParticipating( String country_code ) throws RemoteException, SQLException;

	/**
	 * Set the default_taxform_id field in the country table corresponding to the given key.
	 * @param country_code the table primary key
	 * @param default_taxform_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDefaultTaxformId( String country_code, Long default_taxform_id ) throws RemoteException, SQLException;

	/**
	 * Get the default_taxform_id field from the country table corresponding to the given key.
	 * @param country_code the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Long getDefaultTaxformId( String country_code ) throws RemoteException, SQLException;

	public Lookup listCountryCodeCountryName() throws RemoteException, SQLException;
}
