package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileSkillXrefObject;
// import	com.topcoder.web.common.ResultSetContainer;

/**
 * This is the remote interface for the ProfileSkillXref class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileSkillXref extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param profile_id profile_id
	 * @param skill_id skill_id
	 * @param skill_level_id skill_level_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Long profile_id, Integer skill_id, Integer skill_level_id ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param profile_id profile_id
	 * @param skill_id skill_id
	 * @param skill_level_id skill_level_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Long profile_id, Integer skill_id, Integer skill_level_id ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param profile_id profile_id
	 * @param skill_id skill_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Long profile_id, Integer skill_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ProfileSkillXrefObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ProfileSkillXrefObject request( int cmd, ProfileSkillXrefObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the profile_skill_xref table.
	 * @return a Hashtable containing the concatenated keys,
	 * @return a Hashtable containing the profile_ids as java.lang.Long keys and skill_ids as java.lang.Integer values
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Hashtable list() throws RemoteException, SQLException;

	/**
	 * Set the skill_level_id field in the profile_skill_xref table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param skill_level_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSkillLevelId( Long profile_id, Integer skill_id, Integer skill_level_id ) throws RemoteException, SQLException;

	/**
	 * Get the skill_level_id field from the profile_skill_xref table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getSkillLevelId( Long profile_id, Integer skill_id ) throws RemoteException, SQLException;

	/**
	 * List the skills associated with a specified profile.
	 * @param profileId the profileId to use for the lookup
	 * @return an array of ints containing the corresponding
	 * skillIds
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 */

	public int[] listSkillIdByProfileId( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * List the skills and levels associated with a specified profile.
	 * @param profileId the profileId to use for the lookup
	 * @return a Hashtable containing the Integer skillIds as keys
	 * and the Integer SkillLevelIds as values
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 */

	public Hashtable listSkillIdSkillLevelIdByProfileId( Long profileId )
	  throws RemoteException, SQLException;
}
