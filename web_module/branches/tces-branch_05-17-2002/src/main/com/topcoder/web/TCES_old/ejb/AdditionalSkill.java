package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.AdditionalSkillObject;

/**
 * This is the remote interface for the AdditionalSkill class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface AdditionalSkill extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param additional_skill_id additional_skill_id
	 * @param profile_id profile_id
	 * @param skill_type skill_type
	 * @param description description
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Long additional_skill_id, Long profile_id, String skill_type, String description ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param additional_skill_id additional_skill_id
	 * @param profile_id profile_id
	 * @param skill_type skill_type
	 * @param description description
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Long additional_skill_id, Long profile_id, String skill_type, String description ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param additional_skill_id additional_skill_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Long additional_skill_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.AdditionalSkillObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public AdditionalSkillObject request( int cmd, AdditionalSkillObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the additional_skill table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the profile_id field in the additional_skill table corresponding to the given key.
	 * @param additional_skill_id the table primary key
	 * @param profile_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileId( Long additional_skill_id, Long profile_id ) throws RemoteException, SQLException;

	/**
	 * Get the profile_id field from the additional_skill table corresponding to the given key.
	 * @param additional_skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Long getProfileId( Long additional_skill_id ) throws RemoteException, SQLException;

	/**
	 * Set the skill_type field in the additional_skill table corresponding to the given key.
	 * @param additional_skill_id the table primary key
	 * @param skill_type the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSkillType( Long additional_skill_id, String skill_type ) throws RemoteException, SQLException;

	/**
	 * Get the skill_type field from the additional_skill table corresponding to the given key.
	 * @param additional_skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getSkillType( Long additional_skill_id ) throws RemoteException, SQLException;

	/**
	 * Set the description field in the additional_skill table corresponding to the given key.
	 * @param additional_skill_id the table primary key
	 * @param description the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDescription( Long additional_skill_id, String description ) throws RemoteException, SQLException;

	/**
	 * Get the description field from the additional_skill table corresponding to the given key.
	 * @param additional_skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getDescription( Long additional_skill_id ) throws RemoteException, SQLException;

}
