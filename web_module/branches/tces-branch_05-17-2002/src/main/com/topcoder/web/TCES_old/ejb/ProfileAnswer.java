package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileAnswerObject;

/**
 * This is the remote interface for the ProfileAnswer class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileAnswer extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param answer_id answer_id
	 * @param question_id question_id
	 * @param text text
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Long answer_id, Long question_id, String text ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param answer_id answer_id
	 * @param question_id question_id
	 * @param text text
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Long answer_id, Long question_id, String text ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param answer_id answer_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Long answer_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ProfileAnswerObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ProfileAnswerObject request( int cmd, ProfileAnswerObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the profile_answer table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the question_id field in the profile_answer table corresponding to the given key.
	 * @param answer_id the table primary key
	 * @param question_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setQuestionId( Long answer_id, Long question_id ) throws RemoteException, SQLException;

	/**
	 * Get the question_id field from the profile_answer table corresponding to the given key.
	 * @param answer_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Long getQuestionId( Long answer_id ) throws RemoteException, SQLException;

	/**
	 * Set the text field in the profile_answer table corresponding to the given key.
	 * @param answer_id the table primary key
	 * @param text the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setText( Long answer_id, String text ) throws RemoteException, SQLException;

	/**
	 * Get the text field from the profile_answer table corresponding to the given key.
	 * @param answer_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getText( Long answer_id ) throws RemoteException, SQLException;

}
