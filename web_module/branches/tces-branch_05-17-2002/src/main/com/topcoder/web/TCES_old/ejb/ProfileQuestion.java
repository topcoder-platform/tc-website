package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileQuestionObject;

/**
 * This is the remote interface for the ProfileQuestion class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileQuestion extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param question_id question_id
	 * @param text text
	 * @param question_type_id question_type_id
	 * @param question_style_id question_style_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Long question_id, String text, Integer question_type_id, Integer question_style_id ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param question_id question_id
	 * @param text text
	 * @param question_type_id question_type_id
	 * @param question_style_id question_style_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Long question_id, String text, Integer question_type_id, Integer question_style_id ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param question_id question_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Long question_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ProfileQuestionObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ProfileQuestionObject request( int cmd, ProfileQuestionObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the profile_question table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the text field in the profile_question table corresponding to the given key.
	 * @param question_id the table primary key
	 * @param text the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setText( Long question_id, String text ) throws RemoteException, SQLException;

	/**
	 * Get the text field from the profile_question table corresponding to the given key.
	 * @param question_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getText( Long question_id ) throws RemoteException, SQLException;

	/**
	 * Set the question_type_id field in the profile_question table corresponding to the given key.
	 * @param question_id the table primary key
	 * @param question_type_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setQuestionTypeId( Long question_id, Integer question_type_id ) throws RemoteException, SQLException;

	/**
	 * Get the question_type_id field from the profile_question table corresponding to the given key.
	 * @param question_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getQuestionTypeId( Long question_id ) throws RemoteException, SQLException;

	/**
	 * Set the question_style_id field in the profile_question table corresponding to the given key.
	 * @param question_id the table primary key
	 * @param question_style_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setQuestionStyleId( Long question_id, Integer question_style_id ) throws RemoteException, SQLException;

	/**
	 * Get the question_style_id field from the profile_question table corresponding to the given key.
	 * @param question_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getQuestionStyleId( Long question_id ) throws RemoteException, SQLException;

}
