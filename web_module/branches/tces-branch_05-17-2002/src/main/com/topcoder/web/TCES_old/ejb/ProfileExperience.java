package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileExperienceObject;

/**
 * This is the remote interface for the ProfileExperience class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface ProfileExperience extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param experience_id experience_id
	 * @param date_start date_start
	 * @param date_end date_end
	 * @param job_title job_title
	 * @param company_name company_name
	 * @param company_url company_url
	 * @param job_description job_description
	 * @param profile_id profile_id
	 * @param salary_id salary_id
	 * @param industry_id industry_id
	 * @param job_role_id job_role_id
	 * @param job_type_id job_type_id
	 * @param location_id location_id
	 * @param co_size_id co_size_id
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Integer experience_id, Date date_start, Date date_end, String job_title, String company_name, String company_url, String job_description, Integer profile_id, Integer salary_id, Integer industry_id, Integer job_role_id, Integer job_type_id, Integer location_id, Integer co_size_id ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param experience_id experience_id
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Integer experience_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ProfileExperienceObject
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ProfileExperienceObject request( int cmd, ProfileExperienceObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the profile_experience table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the date_start field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param date_start the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDateStart( Integer experience_id, Date date_start ) throws RemoteException, SQLException;

	/**
	 * Get the date_start field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getDateStart( Integer experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the date_end field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param date_end the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDateEnd( Integer experience_id, Date date_end ) throws RemoteException, SQLException;

	/**
	 * Get the date_end field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getDateEnd( Integer experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the job_title field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param job_title the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setJobTitle( Integer experience_id, String job_title ) throws RemoteException, SQLException;

	/**
	 * Get the job_title field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getJobTitle( Integer experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the company_name field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param company_name the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setCompanyName( Integer experience_id, String company_name ) throws RemoteException, SQLException;

	/**
	 * Get the company_name field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getCompanyName( Integer experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the company_url field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param company_url the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setCompanyUrl( Integer experience_id, String company_url ) throws RemoteException, SQLException;

	/**
	 * Get the company_url field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getCompanyUrl( Integer experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the job_description field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param job_description the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setJobDescription( Integer experience_id, String job_description ) throws RemoteException, SQLException;

	/**
	 * Get the job_description field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getJobDescription( Integer experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the profile_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param profile_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileId( Integer experience_id, Integer profile_id ) throws RemoteException, SQLException;

	/**
	 * Get the profile_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getProfileId( Integer experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the salary_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param salary_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSalaryId( Integer experience_id, Integer salary_id ) throws RemoteException, SQLException;

	/**
	 * Get the salary_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getSalaryId( Integer experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the industry_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param industry_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setIndustryId( Integer experience_id, Integer industry_id ) throws RemoteException, SQLException;

	/**
	 * Get the industry_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getIndustryId( Integer experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the job_role_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param job_role_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setJobRoleId( Integer experience_id, Integer job_role_id ) throws RemoteException, SQLException;

	/**
	 * Get the job_role_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getJobRoleId( Integer experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the job_type_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param job_type_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setJobTypeId( Integer experience_id, Integer job_type_id ) throws RemoteException, SQLException;

	/**
	 * Get the job_type_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getJobTypeId( Integer experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the location_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param location_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setLocationId( Integer experience_id, Integer location_id ) throws RemoteException, SQLException;

	/**
	 * Get the location_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getLocationId( Integer experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the co_size_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param co_size_id the new field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setCoSizeId( Integer experience_id, Integer co_size_id ) throws RemoteException, SQLException;

	/**
	 * Get the co_size_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getCoSizeId( Integer experience_id ) throws RemoteException, SQLException;
}
