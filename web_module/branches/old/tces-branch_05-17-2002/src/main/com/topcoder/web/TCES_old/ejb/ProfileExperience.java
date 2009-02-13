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
	 * @param organization_name organization_name
	 * @param organization_url organization_url
	 * @param job_description job_description
	 * @param profile_id profile_id
	 * @param salary_id salary_id
	 * @param industry_id industry_id
	 * @param job_role_id job_role_id
	 * @param job_type_id job_type_id
	 * @param organization_size_id organization_size_id
	 * @param city city
	 * @param state_code state_code
	 * @param country_code country_code
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Long experience_id, Date date_start, Date date_end, String job_title, String organization_name, String organization_url, String job_description, Long profile_id, Integer salary_id, Integer industry_id, Integer job_role_id, Integer job_type_id, Integer organization_size_id, String city, String state_code, String country_code ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param experience_id experience_id
	 * @param date_start date_start
	 * @param date_end date_end
	 * @param job_title job_title
	 * @param organization_name organization_name
	 * @param organization_url organization_url
	 * @param job_description job_description
	 * @param profile_id profile_id
	 * @param salary_id salary_id
	 * @param industry_id industry_id
	 * @param job_role_id job_role_id
	 * @param job_type_id job_type_id
	 * @param organization_size_id organization_size_id
	 * @param city city
	 * @param state_code state_code
	 * @param country_code country_code
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Long experience_id, Date date_start, Date date_end, String job_title, String organization_name, String organization_url, String job_description, Long profile_id, Integer salary_id, Integer industry_id, Integer job_role_id, Integer job_type_id, Integer organization_size_id, String city, String state_code, String country_code ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param experience_id experience_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Long experience_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.ProfileExperienceObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public ProfileExperienceObject request( int cmd, ProfileExperienceObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the profile_experience table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the date_start field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param date_start the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDateStart( Long experience_id, Date date_start ) throws RemoteException, SQLException;

	/**
	 * Get the date_start field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getDateStart( Long experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the date_end field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param date_end the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDateEnd( Long experience_id, Date date_end ) throws RemoteException, SQLException;

	/**
	 * Get the date_end field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getDateEnd( Long experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the job_title field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param job_title the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setJobTitle( Long experience_id, String job_title ) throws RemoteException, SQLException;

	/**
	 * Get the job_title field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getJobTitle( Long experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the organization_name field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param organization_name the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setOrganizationName( Long experience_id, String organization_name ) throws RemoteException, SQLException;

	/**
	 * Get the organization_name field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getOrganizationName( Long experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the organization_url field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param organization_url the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setOrganizationUrl( Long experience_id, String organization_url ) throws RemoteException, SQLException;

	/**
	 * Get the organization_url field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getOrganizationUrl( Long experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the job_description field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param job_description the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setJobDescription( Long experience_id, String job_description ) throws RemoteException, SQLException;

	/**
	 * Get the job_description field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getJobDescription( Long experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the profile_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param profile_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileId( Long experience_id, Long profile_id ) throws RemoteException, SQLException;

	/**
	 * Get the profile_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Long getProfileId( Long experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the salary_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param salary_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSalaryId( Long experience_id, Integer salary_id ) throws RemoteException, SQLException;

	/**
	 * Get the salary_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getSalaryId( Long experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the industry_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param industry_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setIndustryId( Long experience_id, Integer industry_id ) throws RemoteException, SQLException;

	/**
	 * Get the industry_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getIndustryId( Long experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the job_role_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param job_role_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setJobRoleId( Long experience_id, Integer job_role_id ) throws RemoteException, SQLException;

	/**
	 * Get the job_role_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getJobRoleId( Long experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the job_type_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param job_type_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setJobTypeId( Long experience_id, Integer job_type_id ) throws RemoteException, SQLException;

	/**
	 * Get the job_type_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getJobTypeId( Long experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the organization_size_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param organization_size_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setOrganizationSizeId( Long experience_id, Integer organization_size_id ) throws RemoteException, SQLException;

	/**
	 * Get the organization_size_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getOrganizationSizeId( Long experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the city field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param city the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setCity( Long experience_id, String city ) throws RemoteException, SQLException;

	/**
	 * Get the city field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getCity( Long experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the state_code field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param state_code the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setStateCode( Long experience_id, String state_code ) throws RemoteException, SQLException;

	/**
	 * Get the state_code field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getStateCode( Long experience_id ) throws RemoteException, SQLException;

	/**
	 * Set the country_code field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param country_code the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setCountryCode( Long experience_id, String country_code ) throws RemoteException, SQLException;

	/**
	 * Get the country_code field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getCountryCode( Long experience_id ) throws RemoteException, SQLException;

}
