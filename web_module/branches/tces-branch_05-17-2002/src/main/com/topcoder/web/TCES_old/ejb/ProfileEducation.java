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
	 * @param graduation_date graduation_date
	 * @param new_school new_school
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer education_id, Integer profile_id, Integer degree_type_id, Integer school_id, Date graduation_date, String new_school ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param education_id education_id
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer education_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ProfileEducationObject
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ProfileEducationObject request( int cmd, ProfileEducationObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the profile_education table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the profile_id field in the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @param profile_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileId( Integer education_id, Integer profile_id ) throws RemoteException, SQLException;

	/**
	 * Get the profile_id field from the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getProfileId( Integer education_id ) throws RemoteException, SQLException;

	/**
	 * Set the degree_type_id field in the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @param degree_type_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDegreeTypeId( Integer education_id, Integer degree_type_id ) throws RemoteException, SQLException;

	/**
	 * Get the degree_type_id field from the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getDegreeTypeId( Integer education_id ) throws RemoteException, SQLException;

	/**
	 * Set the school_id field in the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @param school_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSchoolId( Integer education_id, Integer school_id ) throws RemoteException, SQLException;

	/**
	 * Get the school_id field from the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getSchoolId( Integer education_id ) throws RemoteException, SQLException;

	/**
	 * Set the graduation_date field in the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @param graduation_date the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setGraduationDate( Integer education_id, Date graduation_date ) throws RemoteException, SQLException;

	/**
	 * Get the graduation_date field from the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getGraduationDate( Integer education_id ) throws RemoteException, SQLException;

	/**
	 * Set the new_school field in the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @param new_school the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setNewSchool( Integer education_id, String new_school ) throws RemoteException, SQLException;

	/**
	 * Get the new_school field from the profile_education table corresponding to the given key.
	 * @param education_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getNewSchool( Integer education_id ) throws RemoteException, SQLException;
}
