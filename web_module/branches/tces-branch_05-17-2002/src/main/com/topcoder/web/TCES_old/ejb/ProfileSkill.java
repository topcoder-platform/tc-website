package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileSkillObject;

/**
 * This is the remote interface for the ProfileSkill class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileSkill extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param profile_skill_id profile_skill_id
	 * @param profile_id profile_id
	 * @param skill_level_id skill_level_id
	 * @param skill_id skill_id
	 * @param proficiency proficiency
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer profile_skill_id, Integer profile_id, Integer skill_level_id, Integer skill_id, Integer proficiency ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param profile_skill_id profile_skill_id
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer profile_skill_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ProfileSkillObject
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ProfileSkillObject request( int cmd, ProfileSkillObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the profile_skill table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the profile_id field in the profile_skill table corresponding to the given key.
	 * @param profile_skill_id the table primary key
	 * @param profile_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileId( Integer profile_skill_id, Integer profile_id ) throws RemoteException, SQLException;

	/**
	 * Get the profile_id field from the profile_skill table corresponding to the given key.
	 * @param profile_skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getProfileId( Integer profile_skill_id ) throws RemoteException, SQLException;

	/**
	 * Set the skill_level_id field in the profile_skill table corresponding to the given key.
	 * @param profile_skill_id the table primary key
	 * @param skill_level_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSkillLevelId( Integer profile_skill_id, Integer skill_level_id ) throws RemoteException, SQLException;

	/**
	 * Get the skill_level_id field from the profile_skill table corresponding to the given key.
	 * @param profile_skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getSkillLevelId( Integer profile_skill_id ) throws RemoteException, SQLException;

	/**
	 * Set the skill_id field in the profile_skill table corresponding to the given key.
	 * @param profile_skill_id the table primary key
	 * @param skill_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSkillId( Integer profile_skill_id, Integer skill_id ) throws RemoteException, SQLException;

	/**
	 * Get the skill_id field from the profile_skill table corresponding to the given key.
	 * @param profile_skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getSkillId( Integer profile_skill_id ) throws RemoteException, SQLException;

	/**
	 * Set the proficiency field in the profile_skill table corresponding to the given key.
	 * @param profile_skill_id the table primary key
	 * @param proficiency the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProficiency( Integer profile_skill_id, Integer proficiency ) throws RemoteException, SQLException;

	/**
	 * Get the proficiency field from the profile_skill table corresponding to the given key.
	 * @param profile_skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getProficiency( Integer profile_skill_id ) throws RemoteException, SQLException;
}
