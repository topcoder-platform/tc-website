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

public class ProfileExperienceBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public String getKey( Integer experience_id ) {
		String	key = "";

		key += fmt0.format( experience_id );
		return( key );
	}

	public String getKey( ProfileExperienceObject obj ) {
		return( getKey( obj.experience_id ) );
	}

	public void create( Integer experience_id, Date date_start, Date date_end, String job_title, String company_name, String company_url, String job_description, Integer profile_id, Integer salary_id, Integer industry_id, Integer job_role_id, Integer job_type_id, Integer location_id, Integer co_size_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PROFILE_EXPERIENCE VALUES (  " + experience_id + ", ?, ?, '" + job_title + "', '" + company_name + "', '" + company_url + "', '" + job_description + "', " + profile_id + ", " + salary_id + ", " + industry_id + ", " + job_role_id + ", " + job_type_id + ", " + location_id + ", " + co_size_id + " )";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( insert );
			ps.setDate( 1, date_start );
			ps.setDate( 2, date_end );
			ps.executeUpdate();
		} catch( SQLException e ) {
			try { if( ps != null ) ps.close(); } catch( Exception f ) {}
			try { if( conn != null ) conn.close(); } catch( Exception f ) {}
			throw( e );
		} catch( Exception e ) {
		}
		try { if( ps != null ) ps.close(); } catch( Exception f ) {}
		try { if( conn != null ) conn.close(); } catch( Exception f ) {}
	}

	public void delete( Integer experience_id ) throws SQLException {
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
			create( obj.experience_id, obj.date_start, obj.date_end, obj.job_title, obj.company_name, obj.company_url, obj.job_description, obj.profile_id, obj.salary_id, obj.industry_id, obj.job_role_id, obj.job_type_id, obj.location_id, obj.co_size_id );
			break;

		case ProfileExperience.SELECT:
			obj = getRecord( obj.experience_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case ProfileExperience.UPDATE:
			putRecord( obj.experience_id, obj.date_start, obj.date_end, obj.job_title, obj.company_name, obj.company_url, obj.job_description, obj.profile_id, obj.salary_id, obj.industry_id, obj.job_role_id, obj.job_type_id, obj.location_id, obj.co_size_id );
			break;

		case ProfileExperience.DELETE:
			delete( obj.experience_id );
			break;

		}
		return( obj );
	}

	public void setDateStart( Integer experience_id, Date date_start ) throws SQLException {
		putRecord( experience_id, date_start, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public Date getDateStart( Integer experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Date	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.date_start );
	}

	public void setDateEnd( Integer experience_id, Date date_end ) throws SQLException {
		putRecord( experience_id, null, date_end, null, null, null, null, null, null, null, null, null, null, null );
	}

	public Date getDateEnd( Integer experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Date	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.date_end );
	}

	public void setJobTitle( Integer experience_id, String job_title ) throws SQLException {
		putRecord( experience_id, null, null, job_title, null, null, null, null, null, null, null, null, null, null );
	}

	public String getJobTitle( Integer experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		String	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.job_title );
	}

	public void setCompanyName( Integer experience_id, String company_name ) throws SQLException {
		putRecord( experience_id, null, null, null, company_name, null, null, null, null, null, null, null, null, null );
	}

	public String getCompanyName( Integer experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		String	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.company_name );
	}

	public void setCompanyUrl( Integer experience_id, String company_url ) throws SQLException {
		putRecord( experience_id, null, null, null, null, company_url, null, null, null, null, null, null, null, null );
	}

	public String getCompanyUrl( Integer experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		String	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.company_url );
	}

	public void setJobDescription( Integer experience_id, String job_description ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, job_description, null, null, null, null, null, null, null );
	}

	public String getJobDescription( Integer experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		String	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.job_description );
	}

	public void setProfileId( Integer experience_id, Integer profile_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, profile_id, null, null, null, null, null, null );
	}

	public Integer getProfileId( Integer experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Integer	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.profile_id );
	}

	public void setSalaryId( Integer experience_id, Integer salary_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, salary_id, null, null, null, null, null );
	}

	public Integer getSalaryId( Integer experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Integer	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.salary_id );
	}

	public void setIndustryId( Integer experience_id, Integer industry_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, industry_id, null, null, null, null );
	}

	public Integer getIndustryId( Integer experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Integer	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.industry_id );
	}

	public void setJobRoleId( Integer experience_id, Integer job_role_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, job_role_id, null, null, null );
	}

	public Integer getJobRoleId( Integer experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Integer	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.job_role_id );
	}

	public void setJobTypeId( Integer experience_id, Integer job_type_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, null, job_type_id, null, null );
	}

	public Integer getJobTypeId( Integer experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Integer	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.job_type_id );
	}

	public void setLocationId( Integer experience_id, Integer location_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, null, null, location_id, null );
	}

	public Integer getLocationId( Integer experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Integer	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.location_id );
	}

	public void setCoSizeId( Integer experience_id, Integer co_size_id ) throws SQLException {
		putRecord( experience_id, null, null, null, null, null, null, null, null, null, null, null, null, co_size_id );
	}

	public Integer getCoSizeId( Integer experience_id ) throws SQLException {
		ProfileExperienceObject	obj = null;
		Integer	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.co_size_id );
	}

	private class RecordNotFoundException extends Exception {}

	private ProfileExperienceObject getRecord( Integer experience_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		String	key = getKey( experience_id );
		ProfileExperienceObject	obj = null;

		obj = new ProfileExperienceObject();
		String	query = "SELECT experience_id, date_start, date_end, job_title, company_name, company_url, job_description, profile_id, salary_id, industry_id, job_role_id, job_type_id, location_id, co_size_id FROM PROFILE_EXPERIENCE WHERE EXPERIENCE_ID = " + experience_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.experience_id = new Integer( rs.getInt( 1 ) );
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
			obj.company_name = rs.getString( 5 );
			if( rs.wasNull() )
				obj.company_name = null;
			obj.company_url = rs.getString( 6 );
			if( rs.wasNull() )
				obj.company_url = null;
			obj.job_description = rs.getString( 7 );
			if( rs.wasNull() )
				obj.job_description = null;
			obj.profile_id = new Integer( rs.getInt( 8 ) );
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
			obj.location_id = new Integer( rs.getInt( 13 ) );
			if( rs.wasNull() )
				obj.location_id = null;
			obj.co_size_id = new Integer( rs.getInt( 14 ) );
			if( rs.wasNull() )
				obj.co_size_id = null;
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

	public int putRecord(Integer experience_id, Date date_start, Date date_end, String job_title, String company_name, String company_url, String job_description, Integer profile_id, Integer salary_id, Integer industry_id, Integer job_role_id, Integer job_type_id, Integer location_id, Integer co_size_id ) throws SQLException {
		String	identifier = getKey( experience_id );
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
		if( company_name != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "COMPANY_NAME = '" + company_name + "'" );
			count++;
		}
		if( company_url != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "COMPANY_URL = '" + company_url + "'" );
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
		if( location_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "LOCATION_ID = " + location_id.intValue() );
			count++;
		}
		if( co_size_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "CO_SIZE_ID = " + co_size_id.intValue() );
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
				results.add( new Integer( rs.getInt( 1 ) ) );
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
			  context.lookup( "jdbc/TopCoder" );
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
