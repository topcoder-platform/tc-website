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
import	com.topcoder.web.TCES.ejb.User;
import	com.topcoder.web.TCES.ejb.UserObject;

/**
 * This is the implementation of the User class.
 * @see com.topcoder.web.TCES.ejb.User
 * @author Phil Selby, May 22nd, 2002
 */

public class UserBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( java.sql.Connection conn, Long user_id, String handle, String password, String status, Integer user_type_id, String email, String logged_in, String terms, Date last_login ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO USER VALUES (  " + user_id + ", '" + handle + "', '" + password + "', '" + status + "', " + user_type_id + ", '" + email + "', '" + logged_in + "', '" + terms + "', ? )";

		try {
			ps = conn.prepareStatement( insert );
			ps.setDate( 1, last_login );
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

	public void create( Long user_id, String handle, String password, String status, Integer user_type_id, String email, String logged_in, String terms, Date last_login ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, user_id, handle, password, status, user_type_id, email, logged_in, terms, last_login );
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

	public void delete( Long user_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM USER WHERE USER_ID = " + user_id;
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

	public UserObject request( int cmd, UserObject obj ) throws SQLException {

		switch( cmd ) {

		case User.INSERT:
			create( obj.user_id, obj.handle, obj.password, obj.status, obj.user_type_id, obj.email, obj.logged_in, obj.terms, obj.last_login );
			break;

		case User.SELECT:
			obj = getRecord( obj.user_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case User.UPDATE:
			putRecord( obj.user_id, obj.handle, obj.password, obj.status, obj.user_type_id, obj.email, obj.logged_in, obj.terms, obj.last_login );
			break;

		case User.DELETE:
			delete( obj.user_id );
			break;

		}
		return( obj );
	}

	public void setHandle( Long user_id, String handle ) throws SQLException {
		putRecord( user_id, handle, null, null, null, null, null, null, null );
	}

	public String getHandle( Long user_id ) throws SQLException {
		UserObject	obj = null;
		String	result;

		obj = getRecord( user_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.handle );
	}

	public void setPassword( Long user_id, String password ) throws SQLException {
		putRecord( user_id, null, password, null, null, null, null, null, null );
	}

	public String getPassword( Long user_id ) throws SQLException {
		UserObject	obj = null;
		String	result;

		obj = getRecord( user_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.password );
	}

	public void setStatus( Long user_id, String status ) throws SQLException {
		putRecord( user_id, null, null, status, null, null, null, null, null );
	}

	public String getStatus( Long user_id ) throws SQLException {
		UserObject	obj = null;
		String	result;

		obj = getRecord( user_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.status );
	}

	public void setUserTypeId( Long user_id, Integer user_type_id ) throws SQLException {
		putRecord( user_id, null, null, null, user_type_id, null, null, null, null );
	}

	public Integer getUserTypeId( Long user_id ) throws SQLException {
		UserObject	obj = null;
		Integer	result;

		obj = getRecord( user_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.user_type_id );
	}

	public void setEmail( Long user_id, String email ) throws SQLException {
		putRecord( user_id, null, null, null, null, email, null, null, null );
	}

	public String getEmail( Long user_id ) throws SQLException {
		UserObject	obj = null;
		String	result;

		obj = getRecord( user_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.email );
	}

	public void setLoggedIn( Long user_id, String logged_in ) throws SQLException {
		putRecord( user_id, null, null, null, null, null, logged_in, null, null );
	}

	public String getLoggedIn( Long user_id ) throws SQLException {
		UserObject	obj = null;
		String	result;

		obj = getRecord( user_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.logged_in );
	}

	public void setTerms( Long user_id, String terms ) throws SQLException {
		putRecord( user_id, null, null, null, null, null, null, terms, null );
	}

	public String getTerms( Long user_id ) throws SQLException {
		UserObject	obj = null;
		String	result;

		obj = getRecord( user_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.terms );
	}

	public void setLastLogin( Long user_id, Date last_login ) throws SQLException {
		putRecord( user_id, null, null, null, null, null, null, null, last_login );
	}

	public Date getLastLogin( Long user_id ) throws SQLException {
		UserObject	obj = null;
		Date	result;

		obj = getRecord( user_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.last_login );
	}

	private class RecordNotFoundException extends Exception {}

	private UserObject getRecord( Long user_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		UserObject	obj = null;

		obj = new UserObject();
		String	query = "SELECT user_id, handle, password, status, user_type_id, email, logged_in, terms, last_login FROM USER WHERE USER_ID = " + user_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.user_id = new Long( rs.getLong( 1 ) );
			if( rs.wasNull() )
				obj.user_id = null;
			obj.handle = rs.getString( 2 );
			if( rs.wasNull() )
				obj.handle = null;
			obj.password = rs.getString( 3 );
			if( rs.wasNull() )
				obj.password = null;
			obj.status = rs.getString( 4 );
			if( rs.wasNull() )
				obj.status = null;
			obj.user_type_id = new Integer( rs.getInt( 5 ) );
			if( rs.wasNull() )
				obj.user_type_id = null;
			obj.email = rs.getString( 6 );
			if( rs.wasNull() )
				obj.email = null;
			obj.logged_in = rs.getString( 7 );
			if( rs.wasNull() )
				obj.logged_in = null;
			obj.terms = rs.getString( 8 );
			if( rs.wasNull() )
				obj.terms = null;
			obj.last_login  = rs.getDate( 9 );
			if( rs.wasNull() )
				obj.last_login = null;
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

	public int putRecord( Long user_id, String handle, String password, String status, Integer user_type_id, String email, String logged_in, String terms, Date last_login ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE USER SET " );
		if( handle != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "HANDLE = '" + handle + "'" );
			count++;
		}
		if( password != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PASSWORD = '" + password + "'" );
			count++;
		}
		if( status != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "STATUS = '" + status + "'" );
			count++;
		}
		if( user_type_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "USER_TYPE_ID = " + user_type_id.intValue() );
			count++;
		}
		if( email != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "EMAIL = '" + email + "'" );
			count++;
		}
		if( logged_in != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "LOGGED_IN = '" + logged_in + "'" );
			count++;
		}
		if( terms != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "TERMS = '" + terms + "'" );
			count++;
		}
		if( last_login != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "LAST_LOGIN = '" + last_login + "'" );
			count++;
		}
		update.append( " WHERE USER_ID = " + user_id );
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
		String	query = "SELECT USER_ID FROM USER";

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
			  context.lookup( "OLTP" );
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
