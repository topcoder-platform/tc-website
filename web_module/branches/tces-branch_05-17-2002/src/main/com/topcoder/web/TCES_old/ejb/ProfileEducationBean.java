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
import	com.topcoder.web.TCES.ejb.ProfileEducation;
import	com.topcoder.web.TCES.ejb.ProfileEducationObject;

/**
 * This is the implementation of the ProfileEducation class.
 * @see com.topcoder.web.TCES.ejb.ProfileEducation
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileEducationBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( Integer education_id, Integer profile_id, Integer degree_type_id, Integer school_id, Date graduation_date, String new_school ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PROFILE_EDUCATION VALUES (  " + education_id + ", " + profile_id + ", " + degree_type_id + ", " + school_id + ", ?, '" + new_school + "' )";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( insert );
			ps.setDate( 1, graduation_date );
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

	public void delete( Integer education_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM PROFILE_EDUCATION WHERE EDUCATION_ID = " + education_id;
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

	public ProfileEducationObject request( int cmd, ProfileEducationObject obj ) throws SQLException {

		switch( cmd ) {

		case ProfileEducation.INSERT:
			create( obj.education_id, obj.profile_id, obj.degree_type_id, obj.school_id, obj.graduation_date, obj.new_school );
			break;

		case ProfileEducation.SELECT:
			obj = getRecord( obj.education_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case ProfileEducation.UPDATE:
			putRecord( obj.education_id, obj.profile_id, obj.degree_type_id, obj.school_id, obj.graduation_date, obj.new_school );
			break;

		case ProfileEducation.DELETE:
			delete( obj.education_id );
			break;

		}
		return( obj );
	}

	public void setProfileId( Integer education_id, Integer profile_id ) throws SQLException {
		putRecord( education_id, profile_id, null, null, null, null );
	}

	public Integer getProfileId( Integer education_id ) throws SQLException {
		ProfileEducationObject	obj = null;
		Integer	result;

		obj = getRecord( education_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.profile_id );
	}

	public void setDegreeTypeId( Integer education_id, Integer degree_type_id ) throws SQLException {
		putRecord( education_id, null, degree_type_id, null, null, null );
	}

	public Integer getDegreeTypeId( Integer education_id ) throws SQLException {
		ProfileEducationObject	obj = null;
		Integer	result;

		obj = getRecord( education_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.degree_type_id );
	}

	public void setSchoolId( Integer education_id, Integer school_id ) throws SQLException {
		putRecord( education_id, null, null, school_id, null, null );
	}

	public Integer getSchoolId( Integer education_id ) throws SQLException {
		ProfileEducationObject	obj = null;
		Integer	result;

		obj = getRecord( education_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.school_id );
	}

	public void setGraduationDate( Integer education_id, Date graduation_date ) throws SQLException {
		putRecord( education_id, null, null, null, graduation_date, null );
	}

	public Date getGraduationDate( Integer education_id ) throws SQLException {
		ProfileEducationObject	obj = null;
		Date	result;

		obj = getRecord( education_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.graduation_date );
	}

	public void setNewSchool( Integer education_id, String new_school ) throws SQLException {
		putRecord( education_id, null, null, null, null, new_school );
	}

	public String getNewSchool( Integer education_id ) throws SQLException {
		ProfileEducationObject	obj = null;
		String	result;

		obj = getRecord( education_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.new_school );
	}

	private class RecordNotFoundException extends Exception {}

	private ProfileEducationObject getRecord( Integer education_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		ProfileEducationObject	obj = null;

		obj = new ProfileEducationObject();
		String	query = "SELECT education_id, profile_id, degree_type_id, school_id, graduation_date, new_school FROM PROFILE_EDUCATION WHERE EDUCATION_ID = " + education_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.education_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.education_id = null;
			obj.profile_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.profile_id = null;
			obj.degree_type_id = new Integer( rs.getInt( 3 ) );
			if( rs.wasNull() )
				obj.degree_type_id = null;
			obj.school_id = new Integer( rs.getInt( 4 ) );
			if( rs.wasNull() )
				obj.school_id = null;
			obj.graduation_date  = rs.getDate( 5 );
			if( rs.wasNull() )
				obj.graduation_date = null;
			obj.new_school = rs.getString( 6 );
			if( rs.wasNull() )
				obj.new_school = null;
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

	public int putRecord( Integer education_id, Integer profile_id, Integer degree_type_id, Integer school_id, Date graduation_date, String new_school ) throws SQLException {
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
		if( graduation_date != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "GRADUATION_DATE = '" + graduation_date + "'" );
			count++;
		}
		if( new_school != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "NEW_SCHOOL = '" + new_school + "'" );
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
		String	query = "SELECT EDUCATION_ID FROM PROFILE_EDUCATION";

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
