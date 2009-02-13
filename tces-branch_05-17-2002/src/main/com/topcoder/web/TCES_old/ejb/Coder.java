package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.CoderObject;

/**
 * This is the remote interface for the Coder class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface Coder extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param coder_id coder_id
	 * @param state_code state_code
	 * @param country_code country_code
	 * @param first_name first_name
	 * @param last_name last_name
	 * @param home_phone home_phone
	 * @param work_phone work_phone
	 * @param address1 address1
	 * @param address2 address2
	 * @param city city
	 * @param zip zip
	 * @param middle_name middle_name
	 * @param activation_code activation_code
	 * @param member_since member_since
	 * @param notify notify
	 * @param quote quote
	 * @param employer_search employer_search
	 * @param relocate relocate
	 * @param modify_date modify_date
	 * @param referral_id referral_id
	 * @param editor_id editor_id
	 * @param notify_inquiry notify_inquiry
	 * @param referral_user_id referral_user_id
	 * @param language_id language_id
	 * @param coder_type_id coder_type_id
	 * @param image image
	 * @param date_of_birth date_of_birth
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Long coder_id, String state_code, String country_code, String first_name, String last_name, String home_phone, String work_phone, String address1, String address2, String city, String zip, String middle_name, String activation_code, Date member_since, String notify, String quote, String employer_search, String relocate, Date modify_date, Integer referral_id, Integer editor_id, String notify_inquiry, Long referral_user_id, Integer language_id, Integer coder_type_id, Integer image, Date date_of_birth ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param coder_id coder_id
	 * @param state_code state_code
	 * @param country_code country_code
	 * @param first_name first_name
	 * @param last_name last_name
	 * @param home_phone home_phone
	 * @param work_phone work_phone
	 * @param address1 address1
	 * @param address2 address2
	 * @param city city
	 * @param zip zip
	 * @param middle_name middle_name
	 * @param activation_code activation_code
	 * @param member_since member_since
	 * @param notify notify
	 * @param quote quote
	 * @param employer_search employer_search
	 * @param relocate relocate
	 * @param modify_date modify_date
	 * @param referral_id referral_id
	 * @param editor_id editor_id
	 * @param notify_inquiry notify_inquiry
	 * @param referral_user_id referral_user_id
	 * @param language_id language_id
	 * @param coder_type_id coder_type_id
	 * @param image image
	 * @param date_of_birth date_of_birth
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Long coder_id, String state_code, String country_code, String first_name, String last_name, String home_phone, String work_phone, String address1, String address2, String city, String zip, String middle_name, String activation_code, Date member_since, String notify, String quote, String employer_search, String relocate, Date modify_date, Integer referral_id, Integer editor_id, String notify_inquiry, Long referral_user_id, Integer language_id, Integer coder_type_id, Integer image, Date date_of_birth ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param coder_id coder_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.CoderObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public CoderObject request( int cmd, CoderObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the coder table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the state_code field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param state_code the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setStateCode( Long coder_id, String state_code ) throws RemoteException, SQLException;

	/**
	 * Get the state_code field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getStateCode( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the country_code field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param country_code the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setCountryCode( Long coder_id, String country_code ) throws RemoteException, SQLException;

	/**
	 * Get the country_code field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getCountryCode( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the first_name field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param first_name the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setFirstName( Long coder_id, String first_name ) throws RemoteException, SQLException;

	/**
	 * Get the first_name field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getFirstName( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the last_name field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param last_name the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setLastName( Long coder_id, String last_name ) throws RemoteException, SQLException;

	/**
	 * Get the last_name field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getLastName( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the home_phone field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param home_phone the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setHomePhone( Long coder_id, String home_phone ) throws RemoteException, SQLException;

	/**
	 * Get the home_phone field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getHomePhone( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the work_phone field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param work_phone the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setWorkPhone( Long coder_id, String work_phone ) throws RemoteException, SQLException;

	/**
	 * Get the work_phone field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getWorkPhone( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the address1 field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param address1 the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setAddress1( Long coder_id, String address1 ) throws RemoteException, SQLException;

	/**
	 * Get the address1 field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getAddress1( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the address2 field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param address2 the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setAddress2( Long coder_id, String address2 ) throws RemoteException, SQLException;

	/**
	 * Get the address2 field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getAddress2( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the city field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param city the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setCity( Long coder_id, String city ) throws RemoteException, SQLException;

	/**
	 * Get the city field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getCity( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the zip field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param zip the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setZip( Long coder_id, String zip ) throws RemoteException, SQLException;

	/**
	 * Get the zip field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getZip( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the middle_name field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param middle_name the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setMiddleName( Long coder_id, String middle_name ) throws RemoteException, SQLException;

	/**
	 * Get the middle_name field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getMiddleName( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the activation_code field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param activation_code the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setActivationCode( Long coder_id, String activation_code ) throws RemoteException, SQLException;

	/**
	 * Get the activation_code field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getActivationCode( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the member_since field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param member_since the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setMemberSince( Long coder_id, Date member_since ) throws RemoteException, SQLException;

	/**
	 * Get the member_since field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getMemberSince( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the notify field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param notify the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setNotify( Long coder_id, String notify ) throws RemoteException, SQLException;

	/**
	 * Get the notify field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getNotify( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the quote field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param quote the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setQuote( Long coder_id, String quote ) throws RemoteException, SQLException;

	/**
	 * Get the quote field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getQuote( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the employer_search field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param employer_search the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setEmployerSearch( Long coder_id, String employer_search ) throws RemoteException, SQLException;

	/**
	 * Get the employer_search field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getEmployerSearch( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the relocate field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param relocate the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setRelocate( Long coder_id, String relocate ) throws RemoteException, SQLException;

	/**
	 * Get the relocate field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getRelocate( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the modify_date field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param modify_date the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setModifyDate( Long coder_id, Date modify_date ) throws RemoteException, SQLException;

	/**
	 * Get the modify_date field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getModifyDate( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the referral_id field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param referral_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setReferralId( Long coder_id, Integer referral_id ) throws RemoteException, SQLException;

	/**
	 * Get the referral_id field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getReferralId( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the editor_id field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param editor_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setEditorId( Long coder_id, Integer editor_id ) throws RemoteException, SQLException;

	/**
	 * Get the editor_id field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getEditorId( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the notify_inquiry field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param notify_inquiry the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setNotifyInquiry( Long coder_id, String notify_inquiry ) throws RemoteException, SQLException;

	/**
	 * Get the notify_inquiry field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getNotifyInquiry( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the referral_user_id field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param referral_user_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setReferralUserId( Long coder_id, Long referral_user_id ) throws RemoteException, SQLException;

	/**
	 * Get the referral_user_id field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Long getReferralUserId( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the language_id field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param language_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setLanguageId( Long coder_id, Integer language_id ) throws RemoteException, SQLException;

	/**
	 * Get the language_id field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getLanguageId( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the coder_type_id field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param coder_type_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setCoderTypeId( Long coder_id, Integer coder_type_id ) throws RemoteException, SQLException;

	/**
	 * Get the coder_type_id field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getCoderTypeId( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the image field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param image the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setImage( Long coder_id, Integer image ) throws RemoteException, SQLException;

	/**
	 * Get the image field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getImage( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set the date_of_birth field in the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param date_of_birth the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDateOfBirth( Long coder_id, Date date_of_birth ) throws RemoteException, SQLException;

	/**
	 * Get the date_of_birth field from the coder table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getDateOfBirth( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Determine whether a coder is a student.
	 * @param profileId the profile_id of the coder
	 * @return true if the coder is a student (coder_type_id == 1)
	 * or false if not
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, June 15th, 2002
	 */

	public boolean isStudent( Long profileId ) throws RemoteException,
	  SQLException;

	/**
	 * Set the coder to be a student.
	 * @param profileId the profile_id of the coder
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, June 15th, 2002
	 */

	public void setIsStudent( Long profileId ) throws RemoteException,
	  SQLException;
}
