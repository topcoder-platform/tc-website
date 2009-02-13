package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ExperienceSkillXrefObject;

/**
 * This is the remote interface for the ExperienceSkillXref class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface ExperienceSkillXref extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param experience_id experience_id
	 * @param skill_id skill_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Long experience_id, Integer skill_id ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param experience_id experience_id
	 * @param skill_id skill_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Long experience_id, Integer skill_id ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param experience_id experience_id
	 * @param skill_id skill_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Long experience_id, Integer skill_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ExperienceSkillXrefObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ExperienceSkillXrefObject request( int cmd, ExperienceSkillXrefObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the experience_skill_xref table.
	 * @return a Hashtable containing the concatenated keys,
	 * @return a Hashtable containing the experience_ids as java.lang.Long keys and skill_ids as java.lang.Integer values
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Hashtable list() throws RemoteException, SQLException;

}
