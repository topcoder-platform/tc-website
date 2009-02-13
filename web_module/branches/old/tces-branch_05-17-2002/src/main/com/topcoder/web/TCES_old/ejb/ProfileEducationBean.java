package	com.topcoder.web.TCES.ejb;

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
import	com.topcoder.web.TCES.ejb.ProfileEducation;
import	com.topcoder.web.TCES.ejb.ProfileEducationObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the ProfileEducation class.
 * @see com.topcoder.web.TCES.ejb.ProfileEducation
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileEducationBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	private static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( java.sql.Connection conn, Long education_id, Long profile_id, Integer degree_type_id, Long school_id, Integer graduation_year, Integer graduation_month, Integer gpa_id ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PROFILE_EDUCATION VALUES (  " + education_id + ", " + profile_id + ", " + degree_type_id + ", " + school_id + ", " + graduation_year + ", " + graduation_month + ", " + gpa_id + " )";

		try {
			ps = conn.prepareStatement( insert );
			ps.executeUpdate();
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {};
		}
	}

	public void create( Long education_id, Long profile_id, Integer degree_type_id, Long school_id, Integer graduation_year, Integer graduation_month, Integer gpa_id ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, education_id, profile_id, degree_type_id, school_id, graduation_year, graduation_month, gpa_id );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Long education_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM PROFILE_EDUCATION WHERE EDUCATION_ID = " + education_id;
		PreparedStatement	ps = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( delete );
			ps.executeUpdate();
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
		}
	}

	public ProfileEducationObject request( int cmd, ProfileEducationObject obj ) throws SQLException {

		switch( cmd ) {

		case ProfileEducation.INSERT:
			create( obj.education_id, obj.profile_id, obj.degree_type_id, obj.school_id, obj.graduation_year, obj.graduation_month, obj.gpa_id );
			break;

		case ProfileEducation.SELECT:
			obj = getRecord( obj.education_id );
			break;

		case ProfileEducation.UPDATE:
			putRecord( obj.education_id, obj.profile_id, obj.degree_type_id, obj.school_id, obj.graduation_year, obj.graduation_month, obj.gpa_id );
			break;

		case ProfileEducation.DELETE:
			delete( obj.education_id );
			break;

		}
		return( obj );
	}

	public void setProfileId( Long education_id, Long profile_id ) throws SQLException {
		putRecord( education_id, profile_id, null, null, null, null, null );
	}

	public Long getProfileId( Long education_id ) throws SQLException {
		return( ( (ProfileEducationObject) getRecord( education_id ) ).profile_id );
	}

	public void setDegreeTypeId( Long education_id, Integer degree_type_id ) throws SQLException {
		putRecord( education_id, null, degree_type_id, null, null, null, null );
	}

	public Integer getDegreeTypeId( Long education_id ) throws SQLException {
		return( ( (ProfileEducationObject) getRecord( education_id ) ).degree_type_id );
	}

	public void setSchoolId( Long education_id, Long school_id ) throws SQLException {
		putRecord( education_id, null, null, school_id, null, null, null );
	}

	public Long getSchoolId( Long education_id ) throws SQLException {
		return( ( (ProfileEducationObject) getRecord( education_id ) ).school_id );
	}

	public void setGraduationYear( Long education_id, Integer graduation_year ) throws SQLException {
		putRecord( education_id, null, null, null, graduation_year, null, null );
	}

	public Integer getGraduationYear( Long education_id ) throws SQLException {
		return( ( (ProfileEducationObject) getRecord( education_id ) ).graduation_year );
	}

	public void setGraduationMonth( Long education_id, Integer graduation_month ) throws SQLException {
		putRecord( education_id, null, null, null, null, graduation_month, null );
	}

	public Integer getGraduationMonth( Long education_id ) throws SQLException {
		return( ( (ProfileEducationObject) getRecord( education_id ) ).graduation_month );
	}

	public void setGpaId( Long education_id, Integer gpa_id ) throws SQLException {
		putRecord( education_id, null, null, null, null, null, gpa_id );
	}

	public Integer getGpaId( Long education_id ) throws SQLException {
		return( ( (ProfileEducationObject) getRecord( education_id ) ).gpa_id );
	}

	private ProfileEducationObject getRecord( Long education_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		ProfileEducationObject	obj = null;

		obj = new ProfileEducationObject();
		String	query = "SELECT education_id, profile_id, degree_type_id, school_id, graduation_year, graduation_month, gpa_id FROM PROFILE_EDUCATION WHERE EDUCATION_ID = " + education_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.education_id = new Long( rs.getLong( 1 ) );
			if( rs.wasNull() )
				obj.education_id = null;
			obj.profile_id = new Long( rs.getLong( 2 ) );
			if( rs.wasNull() )
				obj.profile_id = null;
			obj.degree_type_id = new Integer( rs.getInt( 3 ) );
			if( rs.wasNull() )
				obj.degree_type_id = null;
			obj.school_id = new Long( rs.getLong( 4 ) );
			if( rs.wasNull() )
				obj.school_id = null;
			obj.graduation_year = new Integer( rs.getInt( 5 ) );
			if( rs.wasNull() )
				obj.graduation_year = null;
			obj.graduation_month = new Integer( rs.getInt( 6 ) );
			if( rs.wasNull() )
				obj.graduation_month = null;
			obj.gpa_id = new Integer( rs.getInt( 7 ) );
			if( rs.wasNull() )
				obj.gpa_id = null;
			rs.close();
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( rs != null ) try { rs.close(); } catch( Exception f ) {}
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
		}
		return( obj );
	}

	public int putRecord( Long education_id, Long profile_id, Integer degree_type_id, Long school_id, Integer graduation_year, Integer graduation_month, Integer gpa_id ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PROFILE_EDUCATION SET " );
		if( profile_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PROFILE_ID = " + profile_id.intValue() );
			count++;
		}
		if( degree_type_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "DEGREE_TYPE_ID = " + degree_type_id.intValue() );
			count++;
		}
		if( school_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SCHOOL_ID = " + school_id.intValue() );
			count++;
		}
		if( graduation_year != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "GRADUATION_YEAR = " + graduation_year.intValue() );
			count++;
		}
		if( graduation_month != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "GRADUATION_MONTH = " + graduation_month.intValue() );
			count++;
		}
		if( gpa_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "GPA_ID = " + gpa_id.intValue() );
			count++;
		}
		update.append( " WHERE EDUCATION_ID = " + education_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			rc = ps.executeUpdate();
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
		}
		return( rc );
	}

	public String list() throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = "SELECT EDUCATION_ID FROM PROFILE_EDUCATION";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Long( rs.getLong( 1 ) ) );
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
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


	private Connection getConnection() throws SQLException {
		try {
			Context context = new InitialContext();
			String dsName = (String) context.lookup(
			  "DSname" );
			DataSource ds = (DataSource)
			  context.lookup( dsName );
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
