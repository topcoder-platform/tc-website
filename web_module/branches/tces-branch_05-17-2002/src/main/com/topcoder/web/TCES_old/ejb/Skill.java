package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.SkillObject;

/**
 * This is the remote interface for the Skill class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface Skill extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param skill_id skill_id
	 * @param skill_type_id skill_type_id
	 * @param skill_desc skill_desc
	 * @param skill_order skill_order
	 * @param status status
	 * @param modify_date modify_date
	 * @param profile_id profile_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer skill_id, Integer skill_type_id, String skill_desc, Integer skill_order, String status, Date modify_date, Long profile_id ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param skill_id skill_id
	 * @param skill_type_id skill_type_id
	 * @param skill_desc skill_desc
	 * @param skill_order skill_order
	 * @param status status
	 * @param modify_date modify_date
	 * @param profile_id profile_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Integer skill_id, Integer skill_type_id, String skill_desc, Integer skill_order, String status, Date modify_date, Long profile_id ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param skill_id skill_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer skill_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.SkillObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public SkillObject request( int cmd, SkillObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the skill table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the skill_type_id field in the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @param skill_type_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSkillTypeId( Integer skill_id, Integer skill_type_id ) throws RemoteException, SQLException;

	/**
	 * Get the skill_type_id field from the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getSkillTypeId( Integer skill_id ) throws RemoteException, SQLException;

	/**
	 * Set the skill_desc field in the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @param skill_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSkillDesc( Integer skill_id, String skill_desc ) throws RemoteException, SQLException;

	/**
	 * Get the skill_desc field from the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getSkillDesc( Integer skill_id ) throws RemoteException, SQLException;

	/**
	 * Set the skill_order field in the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @param skill_order the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSkillOrder( Integer skill_id, Integer skill_order ) throws RemoteException, SQLException;

	/**
	 * Get the skill_order field from the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getSkillOrder( Integer skill_id ) throws RemoteException, SQLException;

	/**
	 * Set the status field in the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @param status the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setStatus( Integer skill_id, String status ) throws RemoteException, SQLException;

	/**
	 * Get the status field from the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getStatus( Integer skill_id ) throws RemoteException, SQLException;

	/**
	 * Set the modify_date field in the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @param modify_date the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setModifyDate( Integer skill_id, Date modify_date ) throws RemoteException, SQLException;

	/**
	 * Get the modify_date field from the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getModifyDate( Integer skill_id ) throws RemoteException, SQLException;

	/**
	 * Set the profile_id field in the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @param profile_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileId( Integer skill_id, Long profile_id ) throws RemoteException, SQLException;

	/**
	 * Get the profile_id field from the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Long getProfileId( Integer skill_id ) throws RemoteException, SQLException;

	/**
	 * List skills and their descriptions.
	 * @return a Hashtable containing Integer skillIds as keys
	 * and String skillDescs as the values
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 */

	public Hashtable listSkillDescBySkillId()
	  throws RemoteException, SQLException;
}
