package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ConcentrationObject;

/**
 * This is the remote interface for the Concentration class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface Concentration extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param concentration_id concentration_id
	 * @param subject_id subject_id
	 * @param education_id education_id
	 * @param concentration_type concentration_type
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer concentration_id, Integer subject_id, Integer education_id, Integer concentration_type ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param concentration_id concentration_id
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer concentration_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ConcentrationObject
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ConcentrationObject request( int cmd, ConcentrationObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the concentration table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the subject_id field in the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @param subject_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSubjectId( Integer concentration_id, Integer subject_id ) throws RemoteException, SQLException;

	/**
	 * Get the subject_id field from the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getSubjectId( Integer concentration_id ) throws RemoteException, SQLException;

	/**
	 * Set the education_id field in the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @param education_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setEducationId( Integer concentration_id, Integer education_id ) throws RemoteException, SQLException;

	/**
	 * Get the education_id field from the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getEducationId( Integer concentration_id ) throws RemoteException, SQLException;

	/**
	 * Set the concentration_type field in the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @param concentration_type the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setConcentrationType( Integer concentration_id, Integer concentration_type ) throws RemoteException, SQLException;

	/**
	 * Get the concentration_type field from the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getConcentrationType( Integer concentration_id ) throws RemoteException, SQLException;
}
