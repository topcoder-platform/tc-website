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
	 * @param concentration_type_id concentration_type_id
	 * @param education_id education_id
	 * @param subject_id subject_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Long concentration_id, Integer concentration_type_id, Long education_id, Integer subject_id ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param concentration_id concentration_id
	 * @param concentration_type_id concentration_type_id
	 * @param education_id education_id
	 * @param subject_id subject_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Long concentration_id, Integer concentration_type_id, Long education_id, Integer subject_id ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param concentration_id concentration_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Long concentration_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ConcentrationObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ConcentrationObject request( int cmd, ConcentrationObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the concentration table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the concentration_type_id field in the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @param concentration_type_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setConcentrationTypeId( Long concentration_id, Integer concentration_type_id ) throws RemoteException, SQLException;

	/**
	 * Get the concentration_type_id field from the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getConcentrationTypeId( Long concentration_id ) throws RemoteException, SQLException;

	/**
	 * Set the education_id field in the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @param education_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setEducationId( Long concentration_id, Long education_id ) throws RemoteException, SQLException;

	/**
	 * Get the education_id field from the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Long getEducationId( Long concentration_id ) throws RemoteException, SQLException;

	/**
	 * Set the subject_id field in the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @param subject_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSubjectId( Long concentration_id, Integer subject_id ) throws RemoteException, SQLException;

	/**
	 * Get the subject_id field from the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getSubjectId( Long concentration_id ) throws RemoteException, SQLException;

}
