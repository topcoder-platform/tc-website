package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileObject;

/**
 * This is the remote interface for the Profile class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface Profile extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param profile_id profile_id
	 * @param date_available date_available
	 * @param profile_status_id profile_status_id
	 * @param preference_travel_level_id preference_travel_level_id
	 * @param preference_travel_time_id preference_travel_time_id
	 * @param preference_salary_id preference_salary_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Long profile_id, Date date_available, Integer profile_status_id, Integer preference_travel_level_id, Integer preference_travel_time_id, Integer preference_salary_id ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param profile_id profile_id
	 * @param date_available date_available
	 * @param profile_status_id profile_status_id
	 * @param preference_travel_level_id preference_travel_level_id
	 * @param preference_travel_time_id preference_travel_time_id
	 * @param preference_salary_id preference_salary_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Long profile_id, Date date_available, Integer profile_status_id, Integer preference_travel_level_id, Integer preference_travel_time_id, Integer preference_salary_id ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param profile_id profile_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Long profile_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ProfileObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ProfileObject request( int cmd, ProfileObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the profile table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the date_available field in the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param date_available the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDateAvailable( Long profile_id, Date date_available ) throws RemoteException, SQLException;

	/**
	 * Get the date_available field from the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getDateAvailable( Long profile_id ) throws RemoteException, SQLException;

	/**
	 * Set the profile_status_id field in the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param profile_status_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileStatusId( Long profile_id, Integer profile_status_id ) throws RemoteException, SQLException;

	/**
	 * Get the profile_status_id field from the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getProfileStatusId( Long profile_id ) throws RemoteException, SQLException;

	/**
	 * Set the preference_travel_level_id field in the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param preference_travel_level_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setPreferenceTravelLevelId( Long profile_id, Integer preference_travel_level_id ) throws RemoteException, SQLException;

	/**
	 * Get the preference_travel_level_id field from the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getPreferenceTravelLevelId( Long profile_id ) throws RemoteException, SQLException;

	/**
	 * Set the preference_travel_time_id field in the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param preference_travel_time_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setPreferenceTravelTimeId( Long profile_id, Integer preference_travel_time_id ) throws RemoteException, SQLException;

	/**
	 * Get the preference_travel_time_id field from the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getPreferenceTravelTimeId( Long profile_id ) throws RemoteException, SQLException;

	/**
	 * Set the preference_salary_id field in the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param preference_salary_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setPreferenceSalaryId( Long profile_id, Integer preference_salary_id ) throws RemoteException, SQLException;

	/**
	 * Get the preference_salary_id field from the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getPreferenceSalaryId( Long profile_id ) throws RemoteException, SQLException;

}
