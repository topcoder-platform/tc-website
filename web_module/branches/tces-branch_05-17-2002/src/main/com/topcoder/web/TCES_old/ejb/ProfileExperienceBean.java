package	com.topcoder.web.TCES.ejb;

import	java.sql.Connection;
import	java.sql.PreparedStatement;
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
import	com.topcoder.web.TCES.ejb.ProfileExperience;
import	com.topcoder.web.TCES.ejb.ProfileExperienceObject;

/**
 * This is the implementation of the ProfileExperience class.
 * @see com.topcoder.web.TCES.ejb.ProfileExperience
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileExperienceBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( java.sql.Connection conn, Long experience_id, Date date_start, Date date_end, String job_title, String organization_name, String organization_url, String job_description, Long profile_id, Integer salary_id, Integer industry_id, Integer job_role_id, Integer job_type_id, Integer organization_size_id, Integer management_level_id, String city, String state_code, String country_code ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PROFILE_EXPERIENCE VALUES (  " + experience_id + ", ?, ?, '" + job_title + "', '" + organization_name + "', '" + organization_url + "', '" + job_description + "', " + profile_id + ", " + salary_id + ", " + industry_id + ", " + job_role_id + ", " + job_type_id + ", " + organization_size_id + ", " + management_level_id + ", '" + city + "', '" + state_code + "', '" + country_code + "' )";

		try {
			ps = conn.prepareStatement( insert );
			ps.setDate( 1, date_start );
			ps.setDate( 2, date_end );
			ps.executeUpdate();
		} catch( SQLException e ) {
			if( ps != null )
				try { ps.close(); } catch( Exception f ) {};
			ps = null;
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( ps != null )
				try { ps.close(); } catch( Exception f ) {};
		}
	}

	public void create( Long experience_id, Date date_start, Date date_end, String job_title, String organization_name, String organization_url, String job_description, Long profile_id, Integer salary_id, Integer industry_id, Integer job_role_id, Integer job_type_id, Integer organization_size_id, Integer management_level_id, String city, String state_code, String country_code ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, experience_id, date_start, date_end, job_title, organization_name, organization_url, job_description, profile_id, salary_id, industry_id, job_role_id, job_type_id, organization_size_id, management_level_id, city, state_code, country_code );
		} catch( SQLException e ) {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {}
			conn = null;
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Long experience_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM PROFILE_EXPERIENCE WHERE EXPERIENCE_ID = " + experience_id;
		PreparedStatement	ps = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( delete );
			ps.executeUpdate();
		} catch( SQLException e ) {
			try { if( ps != null ) ps.close(); } catch( Exception f ) {}
			try { if( conn != null ) conn.close(); } catch( Exception f ) {}
			throw( e );
		}
		try { if( ps != null ) ps.close(); } catch( Exception f ) {}
		try { if( conn != null ) conn.close(); } catch( Exception f ) {}
	}

	public ProfileExperienceObject request( int cmd, ProfileExperienceObject obj ) throws SQLException {

		switch( cmd ) {

		case ProfileExperience.INSERT:
			create( obj.experience_id, obj.date_start, obj.date_end, obj.job_title, obj.organization_name, obj.organization_url, obj.job_description, obj.profile_id, obj.salary_id, obj.industry_id, obj.job_role_id, obj.job_type_id, obj.organization_size_id, obj.management_level_id, obj.city, obj.state_code, obj.country_code );
			break;

		case ProfileExperience.SELECT:
			obj = getRecord( obj.experience_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case ProfileExperience.UPDATE:
			putRecord( obj.experience_id, obj.date_start, obj.date_end, obj.job_title, obj.organization_name, obj.organization_url, obj.job_description, obj.profile_id, obj.salary_id, obj.industry_id, obj.job_role_id, obj.job_type_id, obj.organization_size_id, obj.management_level_id, obj.city, obj.state_code, obj.country_code );
			break;

		case ProfileExperience.DELETE:
			delete( obj.experience_id );
			break;

		}
		return( obj );
	}

	public void setDateStart( Long experience_id, Date date_start ) throws SQLException {
		putRecord( experience_id, date_start, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public Date getDateStart( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Date	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.date_start );
	}

	public void setDateEnd( Long experience_id, Date date_end ) throws SQLException {
		putRecord( experience_id, null, date_end, null, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public Date getDateEnd( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Date	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.date_end );
	}

	public void setJobTitle( Long experience_id, String job_title ) throws SQLException {
		putRecord( experience_id, null, null, job_title, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getJobTitle( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		String	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.job_title );
	}

	public void setOrganizationName( Long experience_id, String organization_name ) throws SQLException {
		putRecord( experience_id, null, null, null, organization_name, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getOrganizationName( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		String	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.organization_name );
	}

	public void setOrganizationUrl( Long experience_id, String organization_url ) throws SQLException {
		putRecord( experience_id, null, null, null, null, organization_url, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getOrganizationUrl( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		String	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.organization_url );
	}

	public void setJobDescription( Long experience_id, String job_description ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, job_description, null, null, null, null, null, null, null, null, null, null );
	}

	public String getJobDescription( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		String	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.job_description );
	}

	public void setProfileId( Long experience_id, Long profile_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, profile_id, null, null, null, null, null, null, null, null, null );
	}

	public Long getProfileId( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Long	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.profile_id );
	}

	public void setSalaryId( Long experience_id, Integer salary_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, salary_id, null, null, null, null, null, null, null, null );
	}

	public Integer getSalaryId( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Integer	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.salary_id );
	}

	public void setIndustryId( Long experience_id, Integer industry_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, industry_id, null, null, null, null, null, null, null );
	}

	public Integer getIndustryId( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Integer	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.industry_id );
	}

	public void setJobRoleId( Long experience_id, Integer job_role_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, job_role_id, null, null, null, null, null, null );
	}

	public Integer getJobRoleId( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Integer	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.job_role_id );
	}

	public void setJobTypeId( Long experience_id, Integer job_type_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, null, job_type_id, null, null, null, null, null );
	}

	public Integer getJobTypeId( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Integer	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.job_type_id );
	}

	public void setOrganizationSizeId( Long experience_id, Integer organization_size_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, null, null, organization_size_id, null, null, null, null );
	}

	public Integer getOrganizationSizeId( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Integer	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.organization_size_id );
	}

	public void setManagementLevelId( Long experience_id, Integer management_level_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, null, null, null, management_level_id, null, null, null );
	}

	public Integer getManagementLevelId( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Integer	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.management_level_id );
	}

	public void setCity( Long experience_id, String city ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, null, null, null, null, city, null, null );
	}

	public String getCity( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		String	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.city );
	}

	public void setStateCode( Long experience_id, String state_code ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, state_code, null );
	}

	public String getStateCode( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		String	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.state_code );
	}

	public void setCountryCode( Long experience_id, String country_code ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, country_code );
	}

	public String getCountryCode( Long experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		String	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.country_code );
	}

	private class RecordNotFoundException extends Exception {}

	private ProfileExperienceObject getRecord( Long experience_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		ProfileExperienceObject	obj = null;

		obj = new ProfileExperienceObject();
		String	query = "SELECT experience_id, date_start, date_end, job_title, organization_name, organization_url, job_description, profile_id, salary_id, industry_id, job_role_id, job_type_id, organization_size_id, management_level_id, city, state_code, country_code FROM PROFILE_EXPERIENCE WHERE EXPERIENCE_ID = " + experience_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
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
			obj.management_level_id = new Integer( rs.getInt( 14 ) );
			if( rs.wasNull() )
				obj.management_level_id = null;
			obj.city = rs.getString( 15 );
			if( rs.wasNull() )
				obj.city = null;
			obj.state_code = rs.getString( 16 );
			if( rs.wasNull() )
				obj.state_code = null;
			obj.country_code = rs.getString( 17 );
			if( rs.wasNull() )
				obj.country_code = null;
			rs.close();
		} catch( SQLException e ) {
			try { if( ps != null ) ps.close(); } catch( Exception f ) {}
			try { if( conn != null ) conn.close(); } catch( Exception f ) {}
			throw( e );
		} catch( Exception e ) {
			obj = null;
		}
		try { if( ps != null ) ps.close(); } catch( Exception f ) {}
		try { if( conn != null ) conn.close(); } catch( Exception f ) {}
		return( obj );
	}

	public int putRecord( Long experience_id, Date date_start, Date date_end, String job_title, String organization_name, String organization_url, String job_description, Long profile_id, Integer salary_id, Integer industry_id, Integer job_role_id, Integer job_type_id, Integer organization_size_id, Integer management_level_id, String city, String state_code, String country_code ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PROFILE_EXPERIENCE SET " );
		if( date_start != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "DATE_START = '" + date_start + "'" );
			count++;
		}
		if( date_end != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "DATE_END = '" + date_end + "'" );
			count++;
		}
		if( job_title != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "JOB_TITLE = '" + job_title + "'" );
			count++;
		}
		if( organization_name != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "ORGANIZATION_NAME = '" + organization_name + "'" );
			count++;
		}
		if( organization_url != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "ORGANIZATION_URL = '" + organization_url + "'" );
			count++;
		}
		if( job_description != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "JOB_DESCRIPTION = '" + job_description + "'" );
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
		if( management_level_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "MANAGEMENT_LEVEL_ID = " + management_level_id.intValue() );
			count++;
		}
		if( city != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "CITY = '" + city + "'" );
			count++;
		}
		if( state_code != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "STATE_CODE = '" + state_code + "'" );
			count++;
		}
		if( country_code != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "COUNTRY_CODE = '" + country_code + "'" );
			count++;
		}
		update.append( " WHERE EXPERIENCE_ID = " + experience_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			rc = ps.executeUpdate();
		} catch( SQLException e ) {
			try { if( ps != null ) ps.close(); } catch( Exception f ) {}
			try { if( conn != null ) conn.close(); } catch( Exception f ) {}
			throw( e );
		} catch( Exception e ) {
		}
		try { if( ps != null ) ps.close(); } catch( Exception f ) {}
		try { if( conn != null ) conn.close(); } catch( Exception f ) {}
		return( rc );
	}

	public String list() throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = "SELECT EXPERIENCE_ID FROM PROFILE_EXPERIENCE";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Long( rs.getLong( 1 ) ) );
		} catch( SQLException e ) {
			try { if( ps != null ) ps.close(); } catch( Exception f ) {}
			try { if( conn != null ) conn.close(); } catch( Exception f ) {}
			throw( e );
		}
		try { if( ps != null ) ps.close(); } catch( Exception f ) {}
		try { if( conn != null ) conn.close(); } catch( Exception f ) {}
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


	private Connection getConnection() throws SQLException {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)
			  context.lookup( "jdbc/TCES" );
			return( ds.getConnection() );
		}
		catch( NamingException e ) {
			throw new EJBException( e );
		}
	}

	public void ejbCreate() {
	}

	public void ejbRemove() {
	}

	public void setSessionContext( SessionContext context ) {
		this.context = context;
	}

	public void ejbActivate() {
	}

	public void ejbPassivate() {
	}
}
