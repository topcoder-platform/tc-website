package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.SkillLevelObject;

/**
 * This is the remote interface for the SkillLevel class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface SkillLevel extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param skill_level_id skill_level_id
	 * @param description description
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer skill_level_id, String description ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param skill_level_id skill_level_id
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer skill_level_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.SkillLevelObject
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public SkillLevelObject request( int cmd, SkillLevelObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the skill_level table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * List the content of the skill_level table.
	 * @return a Hashtable containing the skill_level_ids as java.lang.Integer keys and descriptions as java.lang.String values
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Hashtable listContent() throws RemoteException, SQLException;

	/**
	 * Set the description field in the skill_level table corresponding to the given key.
	 * @param skill_level_id the table primary key
	 * @param description the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDescription( Integer skill_level_id, String description ) throws RemoteException, SQLException;

	/**
	 * Get the description field from the skill_level table corresponding to the given key.
	 * @param skill_level_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getDescription( Integer skill_level_id ) throws RemoteException, SQLException;
}
