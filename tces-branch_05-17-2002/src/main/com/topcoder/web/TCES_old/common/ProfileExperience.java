package	com.topcoder.web.TCES.common;

import	java.sql.Connection;
import	java.sql.PreparedStatement;
import	java.sql.Statement;
import	java.sql.SQLException;
import	java.sql.ResultSet;
import	java.io.ByteArrayInputStream;
import	java.io.InputStream;
import	java.io.IOException;
import	java.sql.Date;
import	java.text.DecimalFormat;
import	java.util.Hashtable;
import	java.util.Vector;
import	java.util.Enumeration;
import	javax.ejb.*;
import	javax.naming.*;
import	javax.sql.DataSource;
import	com.topcoder.web.TCES.ejb.ProfileExperienceObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the ProfileExperience class.
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileExperience {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public ProfileExperience( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( java.sql.Connection conn, Long experience_id, Date date_start, Date date_end, String job_title, String organization_name, String organization_url, String job_description, Long profile_id, Integer salary_id, Integer industry_id, Integer job_role_id, Integer job_type_id, Integer organization_size_id, String city, String state_code, String country_code ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PROFILE_EXPERIENCE VALUES (  " + experience_id + ", ?, ?, '" + job_title + "', '" + organization_name + "', '" + organization_url + "', '" + job_description + "', " + profile_id + ", " + salary_id + ", " + industry_id + ", " + job_role_id + ", " + job_type_id + ", " + organization_size_id + ", '" + city + "', '" + state_code + "', '" + country_code + "' )";

		try {
			ps = conn.prepareStatement( insert );
			ps.setDate( 1, date_start );
			ps.setDate( 2, date_end );
			ps.executeUpdate();
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {};
		}
	}

	public void create( Long experience_id, Date date_start, Date date_end, String job_title, String organization_name, String organization_url, String job_description, Long profile_id, Integer salary_id, Integer industry_id, Integer job_role_id, Integer job_type_id, Integer organization_size_id, String city, String state_code, String country_code ) throws SQLException {
		try {
			create( conn, experience_id, date_start, date_end, job_title, organization_name, organization_url, job_description, profile_id, salary_id, industry_id, job_role_id, job_type_id, organization_size_id, city, state_code, country_code );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Long experience_id ) throws SQLException {
		String	delete = "DELETE FROM PROFILE_EXPERIENCE WHERE EXPERIENCE_ID = " + experience_id;
		PreparedStatement	ps = null;

		try {
			ps = conn.prepareStatement( delete );
			ps.executeUpdate();
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
		}
	}

	public ProfileExperienceObject request( int cmd, ProfileExperienceObject obj ) throws SQLException {

		switch( cmd ) {

		case ProfileExperience.INSERT:
			create( obj.experience_id, obj.date_start, obj.date_end, obj.job_title, obj.organization_name, obj.organization_url, obj.job_description, obj.profile_id, obj.salary_id, obj.industry_id, obj.job_role_id, obj.job_type_id, obj.organization_size_id, obj.city, obj.state_code, obj.country_code );
			break;

		case ProfileExperience.SELECT:
			obj = getRecord( obj.experience_id );
			break;

		case ProfileExperience.UPDATE:
			putRecord( obj.experience_id, obj.date_start, obj.date_end, obj.job_title, obj.organization_name, obj.organization_url, obj.job_description, obj.profile_id, obj.salary_id, obj.industry_id, obj.job_role_id, obj.job_type_id, obj.organization_size_id, obj.city, obj.state_code, obj.country_code );
			break;

		case ProfileExperience.DELETE:
			delete( obj.experience_id );
			break;

		}
		return( obj );
	}

	/**
	 * Set the date_start field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param date_start the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDateStart( Long experience_id, Date date_start ) throws SQLException {
		putRecord( experience_id, date_start, null, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	/**
	 * Get the date_start field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getDateStart( Long experience_id ) throws SQLException {
		return( ( (ProfileExperienceObject) getRecord( experience_id ) ).date_start );
	}

	/**
	 * Set the date_end field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param date_end the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDateEnd( Long experience_id, Date date_end ) throws SQLException {
		putRecord( experience_id, null, date_end, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	/**
	 * Get the date_end field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getDateEnd( Long experience_id ) throws SQLException {
		return( ( (ProfileExperienceObject) getRecord( experience_id ) ).date_end );
	}

	/**
	 * Set the job_title field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param job_title the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setJobTitle( Long experience_id, String job_title ) throws SQLException {
		putRecord( experience_id, null, null, job_title, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	/**
	 * Get the job_title field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getJobTitle( Long experience_id ) throws SQLException {
		return( ( (ProfileExperienceObject) getRecord( experience_id ) ).job_title );
	}

	/**
	 * Set the organization_name field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param organization_name the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setOrganizationName( Long experience_id, String organization_name ) throws SQLException {
		putRecord( experience_id, null, null, null, organization_name, null, null, null, null, null, null, null, null, null, null, null );
	}

	/**
	 * Get the organization_name field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getOrganizationName( Long experience_id ) throws SQLException {
		return( ( (ProfileExperienceObject) getRecord( experience_id ) ).organization_name );
	}

	/**
	 * Set the organization_url field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param organization_url the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setOrganizationUrl( Long experience_id, String organization_url ) throws SQLException {
		putRecord( experience_id, null, null, null, null, organization_url, null, null, null, null, null, null, null, null, null, null );
	}

	/**
	 * Get the organization_url field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getOrganizationUrl( Long experience_id ) throws SQLException {
		return( ( (ProfileExperienceObject) getRecord( experience_id ) ).organization_url );
	}

	/**
	 * Set the job_description field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param job_description the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setJobDescription( Long experience_id, String job_description ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, job_description, null, null, null, null, null, null, null, null, null );
	}

	/**
	 * Get the job_description field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getJobDescription( Long experience_id ) throws SQLException {
		return( ( (ProfileExperienceObject) getRecord( experience_id ) ).job_description );
	}

	/**
	 * Set the profile_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param profile_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileId( Long experience_id, Long profile_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, profile_id, null, null, null, null, null, null, null, null );
	}

	/**
	 * Get the profile_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Long getProfileId( Long experience_id ) throws SQLException {
		return( ( (ProfileExperienceObject) getRecord( experience_id ) ).profile_id );
	}

	/**
	 * Set the salary_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param salary_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSalaryId( Long experience_id, Integer salary_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, salary_id, null, null, null, null, null, null, null );
	}

	/**
	 * Get the salary_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getSalaryId( Long experience_id ) throws SQLException {
		return( ( (ProfileExperienceObject) getRecord( experience_id ) ).salary_id );
	}

	/**
	 * Set the industry_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param industry_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setIndustryId( Long experience_id, Integer industry_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, industry_id, null, null, null, null, null, null );
	}

	/**
	 * Get the industry_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getIndustryId( Long experience_id ) throws SQLException {
		return( ( (ProfileExperienceObject) getRecord( experience_id ) ).industry_id );
	}

	/**
	 * Set the job_role_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param job_role_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setJobRoleId( Long experience_id, Integer job_role_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, job_role_id, null, null, null, null, null );
	}

	/**
	 * Get the job_role_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getJobRoleId( Long experience_id ) throws SQLException {
		return( ( (ProfileExperienceObject) getRecord( experience_id ) ).job_role_id );
	}

	/**
	 * Set the job_type_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param job_type_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setJobTypeId( Long experience_id, Integer job_type_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, null, job_type_id, null, null, null, null );
	}

	/**
	 * Get the job_type_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getJobTypeId( Long experience_id ) throws SQLException {
		return( ( (ProfileExperienceObject) getRecord( experience_id ) ).job_type_id );
	}

	/**
	 * Set the organization_size_id field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param organization_size_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setOrganizationSizeId( Long experience_id, Integer organization_size_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, null, null, organization_size_id, null, null, null );
	}

	/**
	 * Get the organization_size_id field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getOrganizationSizeId( Long experience_id ) throws SQLException {
		return( ( (ProfileExperienceObject) getRecord( experience_id ) ).organization_size_id );
	}

	/**
	 * Set the city field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param city the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setCity( Long experience_id, String city ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, null, null, null, city, null, null );
	}

	/**
	 * Get the city field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getCity( Long experience_id ) throws SQLException {
		return( ( (ProfileExperienceObject) getRecord( experience_id ) ).city );
	}

	/**
	 * Set the state_code field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param state_code the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setStateCode( Long experience_id, String state_code ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, null, null, null, null, state_code, null );
	}

	/**
	 * Get the state_code field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getStateCode( Long experience_id ) throws SQLException {
		return( ( (ProfileExperienceObject) getRecord( experience_id ) ).state_code );
	}

	/**
	 * Set the country_code field in the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @param country_code the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setCountryCode( Long experience_id, String country_code ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, country_code );
	}

	/**
	 * Get the country_code field from the profile_experience table corresponding to the given key.
	 * @param experience_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getCountryCode( Long experience_id ) throws SQLException {
		return( ( (ProfileExperienceObject) getRecord( experience_id ) ).country_code );
	}

	private ProfileExperienceObject getRecord( Long experience_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		ProfileExperienceObject	obj = null;

		obj = new ProfileExperienceObject();
		String	query = "SELECT experience_id, date_start, date_end, job_title, organization_name, organization_url, job_description, profile_id, salary_id, industry_id, job_role_id, job_type_id, organization_size_id, city, state_code, country_code FROM PROFILE_EXPERIENCE WHERE EXPERIENCE_ID = " + experience_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.experience_id = new Long( rs.getLong( 1 ) );
			if( rs.wasNull() )
				obj.experience_id = null;
			obj.date_start  = rs.getDate( 2 );
			if( rs.wasNull() )
				obj.date_start = null;
			obj.date_end  = rs.getDate( 3 );
			if( rs.wasNull() )
				obj.date_end = null;
			obj.job_title = rs.getString( 4 );
			if( rs.wasNull() )
				obj.job_title = null;
			obj.organization_name = rs.getString( 5 );
			if( rs.wasNull() )
				obj.organization_name = null;
			obj.organization_url = rs.getString( 6 );
			if( rs.wasNull() )
				obj.organization_url = null;
			obj.job_description = rs.getString( 7 );
			if( rs.wasNull() )
				obj.job_description = null;
			obj.profile_id = new Long( rs.getLong( 8 ) );
			if( rs.wasNull() )
				obj.profile_id = null;
			obj.salary_id = new Integer( rs.getInt( 9 ) );
			if( rs.wasNull() )
				obj.salary_id = null;
			obj.industry_id = new Integer( rs.getInt( 10 ) );
			if( rs.wasNull() )
				obj.industry_id = null;
			obj.job_role_id = new Integer( rs.getInt( 11 ) );
			if( rs.wasNull() )
				obj.job_role_id = null;
			obj.job_type_id = new Integer( rs.getInt( 12 ) );
			if( rs.wasNull() )
				obj.job_type_id = null;
			obj.organization_size_id = new Integer( rs.getInt( 13 ) );
			if( rs.wasNull() )
				obj.organization_size_id = null;
			obj.city = rs.getString( 14 );
			if( rs.wasNull() )
				obj.city = null;
			obj.state_code = rs.getString( 15 );
			if( rs.wasNull() )
				obj.state_code = null;
			obj.country_code = rs.getString( 16 );
			if( rs.wasNull() )
				obj.country_code = null;
			rs.close();
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( rs != null ) try { rs.close(); } catch( Exception f ) {}
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
		}
		return( obj );
	}

	public int putRecord( Long experience_id, Date date_start, Date date_end, String job_title, String organization_name, String organization_url, String job_description, Long profile_id, Integer salary_id, Integer industry_id, Integer job_role_id, Integer job_type_id, Integer organization_size_id, String city, String state_code, String country_code ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PROFILE_EXPERIENCE SET " );
		if( date_start != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "DATE_START = ?" );
			count++;
		}
		if( date_end != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "DATE_END = ?" );
			count++;
		}
		if( job_title != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "JOB_TITLE = ?" );
			count++;
		}
		if( organization_name != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "ORGANIZATION_NAME = ?" );
			count++;
		}
		if( organization_url != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "ORGANIZATION_URL = ?" );
			count++;
		}
		if( job_description != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "JOB_DESCRIPTION = ?" );
			count++;
		}
		if( profile_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PROFILE_ID = " + profile_id.intValue() );
			count++;
		}
		if( salary_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SALARY_ID = " + salary_id.intValue() );
			count++;
		}
		if( industry_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "INDUSTRY_ID = " + industry_id.intValue() );
			count++;
		}
		if( job_role_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "JOB_ROLE_ID = " + job_role_id.intValue() );
			count++;
		}
		if( job_type_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "JOB_TYPE_ID = " + job_type_id.intValue() );
			count++;
		}
		if( organization_size_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "ORGANIZATION_SIZE_ID = " + organization_size_id.intValue() );
			count++;
		}
		if( city != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "CITY = ?" );
			count++;
		}
		if( state_code != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "STATE_CODE = ?" );
			count++;
		}
		if( country_code != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "COUNTRY_CODE = ?" );
			count++;
		}
		update.append( " WHERE EXPERIENCE_ID = " + experience_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( date_start != null )
				ps.setDate( index++, date_start );
			if( date_end != null )
				ps.setDate( index++, date_end );
			if( job_title != null )
				ps.setString( index++, job_title );
			if( organization_name != null )
				ps.setString( index++, organization_name );
			if( organization_url != null )
				ps.setString( index++, organization_url );
			if( job_description != null )
				ps.setString( index++, job_description );
			if( city != null )
				ps.setString( index++, city );
			if( state_code != null )
				ps.setString( index++, state_code );
			if( country_code != null )
				ps.setString( index++, country_code );
			rc = ps.executeUpdate();
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
		}
		return( rc );
	}

	public String list() throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = "SELECT EXPERIENCE_ID FROM PROFILE_EXPERIENCE";

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Long( rs.getLong( 1 ) ) );
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
		}
		return( flatten( results ) );
	}

	private String flatten( Vector v ) {
		StringBuffer	sb = new StringBuffer();
		Enumeration	e = v.elements();

		while( e.hasMoreElements() ) {
			if( sb.length() > 0 )
				sb.append( " " );
			sb.append( ( (Integer) e.nextElement() ).intValue() );
		}
		return( sb.toString() );
	}

}
