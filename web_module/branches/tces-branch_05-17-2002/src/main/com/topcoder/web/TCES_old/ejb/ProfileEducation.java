package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileEducationObject;

/**
 * This is the remote interface for the ProfileEducation class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileEducation extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param education_id education_id
	 * @param profile_id profile_id
	 * @param degree_type_id degree_type_id
	 * @param school_id school_id
	 * @param date_graduation date_graduation
	 * @param gpa_id gpa_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Long education_id, Long profile_id, Integer degree_type_id, Integer school_id, Date date_graduation, Integer gpa_id ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param education_id education_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Long education_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ProfileEducationObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ProfileEducationObject request( int cmd, ProfileEducationObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the profile_education table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the profile_id field in the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @param profile_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileId( Long education_id, Long profile_id ) throws RemoteException, SQLException;

	/**
	 * Get the profile_id field from the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Long getProfileId( Long education_id ) throws RemoteException, SQLException;

	/**
	 * Set the degree_type_id field in the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @param degree_type_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDegreeTypeId( Long education_id, Integer degree_type_id ) throws RemoteException, SQLException;

	/**
	 * Get the degree_type_id field from the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getDegreeTypeId( Long education_id ) throws RemoteException, SQLException;

	/**
	 * Set the school_id field in the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @param school_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSchoolId( Long education_id, Integer school_id ) throws RemoteException, SQLException;

	/**
	 * Get the school_id field from the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getSchoolId( Long education_id ) throws RemoteException, SQLException;

	/**
	 * Set the date_graduation field in the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @param date_graduation the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDateGraduation( Long education_id, Date date_graduation ) throws RemoteException, SQLException;

	/**
	 * Get the date_graduation field from the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getDateGraduation( Long education_id ) throws RemoteException, SQLException;

	/**
	 * Set the gpa_id field in the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @param gpa_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setGpaId( Long education_id, Integer gpa_id ) throws RemoteException, SQLException;

	/**
	 * Get the gpa_id field from the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getGpaId( Long education_id ) throws RemoteException, SQLException;
}
