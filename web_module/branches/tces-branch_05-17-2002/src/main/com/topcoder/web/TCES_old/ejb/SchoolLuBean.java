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
import	com.topcoder.web.TCES.ejb.SchoolLu;
import	com.topcoder.web.TCES.ejb.SchoolLuObject;

/**
 * This is the implementation of the SchoolLu class.
 * @see com.topcoder.web.TCES.ejb.SchoolLu
 * @author Phil Selby, May 22nd, 2002
 */

public class SchoolLuBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "00000" );

	public void create( java.sql.Connection conn, Integer school_id, String name, String location, Long profile_id ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO SCHOOL_LU VALUES (  " + school_id + ", '" + name + "', '" + location + "', " + profile_id + " )";

		try {
			ps = conn.prepareStatement( insert );
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

	public void create( Integer school_id, String name, String location, Long profile_id ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, school_id, name, location, profile_id );
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

	public void delete( Integer school_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM SCHOOL_LU WHERE SCHOOL_ID = " + school_id;
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

	public SchoolLuObject request( int cmd, SchoolLuObject obj ) throws SQLException {

		switch( cmd ) {

		case SchoolLu.INSERT:
			create( obj.school_id, obj.name, obj.location, obj.profile_id );
			break;

		case SchoolLu.SELECT:
			obj = getRecord( obj.school_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case SchoolLu.UPDATE:
			putRecord( obj.school_id, obj.name, obj.location, obj.profile_id );
			break;

		case SchoolLu.DELETE:
			delete( obj.school_id );
			break;

		}
		return( obj );
	}

	public void setName( Integer school_id, String name ) throws SQLException {
		putRecord( school_id, name, null, null );
	}

	public String getName( Integer school_id ) throws SQLException {
		SchoolLuObject	obj = null;
		String	result;

		obj = getRecord( school_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.name );
	}

	public void setLocation( Integer school_id, String location ) throws SQLException {
		putRecord( school_id, null, location, null );
	}

	public String getLocation( Integer school_id ) throws SQLException {
		SchoolLuObject	obj = null;
		String	result;

		obj = getRecord( school_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.location );
	}

	public void setProfileId( Integer school_id, Long profile_id ) throws SQLException {
		putRecord( school_id, null, null, profile_id );
	}

	public Long getProfileId( Integer school_id ) throws SQLException {
		SchoolLuObject	obj = null;
		Long	result;

		obj = getRecord( school_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.profile_id );
	}

	private class RecordNotFoundException extends Exception {}

	private SchoolLuObject getRecord( Integer school_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		SchoolLuObject	obj = null;

		obj = new SchoolLuObject();
		String	query = "SELECT school_id, name, location, profile_id FROM SCHOOL_LU WHERE SCHOOL_ID = " + school_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.school_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.school_id = null;
			obj.name = rs.getString( 2 );
			if( rs.wasNull() )
				obj.name = null;
			obj.location = rs.getString( 3 );
			if( rs.wasNull() )
				obj.location = null;
			obj.profile_id = new Long( rs.getLong( 4 ) );
			if( rs.wasNull() )
				obj.profile_id = null;
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

	public int putRecord( Integer school_id, String name, String location, Long profile_id ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE SCHOOL_LU SET " );
		if( name != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "NAME = '" + name + "'" );
			count++;
		}
		if( location != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "LOCATION = '" + location + "'" );
			count++;
		}
		if( profile_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PROFILE_ID = " + profile_id.intValue() );
			count++;
		}
		update.append( " WHERE SCHOOL_ID = " + school_id );
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
		String	query = "SELECT SCHOOL_ID FROM SCHOOL_LU";

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
