package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileResponseObject;

/**
 * This is the remote interface for the ProfileResponse class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileResponse extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param response_id response_id
	 * @param question_id question_id
	 * @param profile_id profile_id
	 * @param answer_id answer_id
	 * @param text text
	 * @param whatisthis whatisthis
	 * @param when when
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer response_id, Integer question_id, Integer profile_id, Integer answer_id, String text, Integer whatisthis, Date when ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param response_id response_id
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer response_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ProfileResponseObject
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ProfileResponseObject request( int cmd, ProfileResponseObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the profile_response table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the question_id field in the profile_response table corresponding to the given key.
	 * @param response_id the table primary key
	 * @param question_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setQuestionId( Integer response_id, Integer question_id ) throws RemoteException, SQLException;

	/**
	 * Get the question_id field from the profile_response table corresponding to the given key.
	 * @param response_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getQuestionId( Integer response_id ) throws RemoteException, SQLException;

	/**
	 * Set the profile_id field in the profile_response table corresponding to the given key.
	 * @param response_id the table primary key
	 * @param profile_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileId( Integer response_id, Integer profile_id ) throws RemoteException, SQLException;

	/**
	 * Get the profile_id field from the profile_response table corresponding to the given key.
	 * @param response_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getProfileId( Integer response_id ) throws RemoteException, SQLException;

	/**
	 * Set the answer_id field in the profile_response table corresponding to the given key.
	 * @param response_id the table primary key
	 * @param answer_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setAnswerId( Integer response_id, Integer answer_id ) throws RemoteException, SQLException;

	/**
	 * Get the answer_id field from the profile_response table corresponding to the given key.
	 * @param response_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getAnswerId( Integer response_id ) throws RemoteException, SQLException;

	/**
	 * Set the text field in the profile_response table corresponding to the given key.
	 * @param response_id the table primary key
	 * @param text the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setText( Integer response_id, String text ) throws RemoteException, SQLException;

	/**
	 * Get the text field from the profile_response table corresponding to the given key.
	 * @param response_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getText( Integer response_id ) throws RemoteException, SQLException;

	/**
	 * Set the whatisthis field in the profile_response table corresponding to the given key.
	 * @param response_id the table primary key
	 * @param whatisthis the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setWhatisthis( Integer response_id, Integer whatisthis ) throws RemoteException, SQLException;

	/**
	 * Get the whatisthis field from the profile_response table corresponding to the given key.
	 * @param response_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getWhatisthis( Integer response_id ) throws RemoteException, SQLException;

	/**
	 * Set the when field in the profile_response table corresponding to the given key.
	 * @param response_id the table primary key
	 * @param when the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setWhen( Integer response_id, Date when ) throws RemoteException, SQLException;

	/**
	 * Get the when field from the profile_response table corresponding to the given key.
	 * @param response_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getWhen( Integer response_id ) throws RemoteException, SQLException;
}
