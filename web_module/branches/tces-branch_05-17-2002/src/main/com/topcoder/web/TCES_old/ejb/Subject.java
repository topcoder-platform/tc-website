package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.SubjectObject;

/**
 * This is the remote interface for the Subject class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface Subject extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param subject_id subject_id
	 * @param description description
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer subject_id, String description ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param subject_id subject_id
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer subject_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.SubjectObject
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public SubjectObject request( int cmd, SubjectObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the subject table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * List the content of the subject table.
	 * @return a Hashtable containing the subject_ids as java.lang.Integer keys and descriptions as java.lang.String values
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Hashtable listContent() throws RemoteException, SQLException;

	/**
	 * Set the description field in the subject table corresponding to the given key.
	 * @param subject_id the table primary key
	 * @param description the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDescription( Integer subject_id, String description ) throws RemoteException, SQLException;

	/**
	 * Get the description field from the subject table corresponding to the given key.
	 * @param subject_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getDescription( Integer subject_id ) throws RemoteException, SQLException;
}
