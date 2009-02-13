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
import	com.topcoder.web.TCES.ejb.UserObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the User class.
 * @author Phil Selby, May 22nd, 2002
 */

public class User {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public User( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( java.sql.Connection conn, Long user_id, String handle, String password, String status, Integer user_type_id, String email, String logged_in, String terms, Date last_login ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO USER VALUES (  " + user_id + ", '" + handle + "', '" + password + "', '" + status + "', " + user_type_id + ", '" + email + "', '" + logged_in + "', '" + terms + "', ? )";

		try {
			ps = conn.prepareStatement( insert );
			ps.setDate( 1, last_login );
			ps.executeUpdate();
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {};
		}
	}

	public void create( Long user_id, String handle, String password, String status, Integer user_type_id, String email, String logged_in, String terms, Date last_login ) throws SQLException {
		try {
			create( conn, user_id, handle, password, status, user_type_id, email, logged_in, terms, last_login );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Long user_id ) throws SQLException {
		String	delete = "DELETE FROM USER WHERE USER_ID = " + user_id;
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

	public UserObject request( int cmd, UserObject obj ) throws SQLException {

		switch( cmd ) {

		case User.INSERT:
			create( obj.user_id, obj.handle, obj.password, obj.status, obj.user_type_id, obj.email, obj.logged_in, obj.terms, obj.last_login );
			break;

		case User.SELECT:
			obj = getRecord( obj.user_id );
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

	/**
	 * Set the handle field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param handle the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setHandle( Long user_id, String handle ) throws SQLException {
		putRecord( user_id, handle, null, null, null, null, null, null, null );
	}

	/**
	 * Get the handle field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getHandle( Long user_id ) throws SQLException {
		return( ( (UserObject) getRecord( user_id ) ).handle );
	}

	/**
	 * Set the password field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param password the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setPassword( Long user_id, String password ) throws SQLException {
		putRecord( user_id, null, password, null, null, null, null, null, null );
	}

	/**
	 * Get the password field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getPassword( Long user_id ) throws SQLException {
		return( ( (UserObject) getRecord( user_id ) ).password );
	}

	/**
	 * Set the status field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param status the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setStatus( Long user_id, String status ) throws SQLException {
		putRecord( user_id, null, null, status, null, null, null, null, null );
	}

	/**
	 * Get the status field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getStatus( Long user_id ) throws SQLException {
		return( ( (UserObject) getRecord( user_id ) ).status );
	}

	/**
	 * Set the user_type_id field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param user_type_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setUserTypeId( Long user_id, Integer user_type_id ) throws SQLException {
		putRecord( user_id, null, null, null, user_type_id, null, null, null, null );
	}

	/**
	 * Get the user_type_id field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getUserTypeId( Long user_id ) throws SQLException {
		return( ( (UserObject) getRecord( user_id ) ).user_type_id );
	}

	/**
	 * Set the email field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param email the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setEmail( Long user_id, String email ) throws SQLException {
		putRecord( user_id, null, null, null, null, email, null, null, null );
	}

	/**
	 * Get the email field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getEmail( Long user_id ) throws SQLException {
		return( ( (UserObject) getRecord( user_id ) ).email );
	}

	/**
	 * Set the logged_in field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param logged_in the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setLoggedIn( Long user_id, String logged_in ) throws SQLException {
		putRecord( user_id, null, null, null, null, null, logged_in, null, null );
	}

	/**
	 * Get the logged_in field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getLoggedIn( Long user_id ) throws SQLException {
		return( ( (UserObject) getRecord( user_id ) ).logged_in );
	}

	/**
	 * Set the terms field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param terms the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setTerms( Long user_id, String terms ) throws SQLException {
		putRecord( user_id, null, null, null, null, null, null, terms, null );
	}

	/**
	 * Get the terms field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getTerms( Long user_id ) throws SQLException {
		return( ( (UserObject) getRecord( user_id ) ).terms );
	}

	/**
	 * Set the last_login field in the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @param last_login the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setLastLogin( Long user_id, Date last_login ) throws SQLException {
		putRecord( user_id, null, null, null, null, null, null, null, last_login );
	}

	/**
	 * Get the last_login field from the user table corresponding to the given key.
	 * @param user_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getLastLogin( Long user_id ) throws SQLException {
		return( ( (UserObject) getRecord( user_id ) ).last_login );
	}

	private UserObject getRecord( Long user_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		UserObject	obj = null;

		obj = new UserObject();
		String	query = "SELECT user_id, handle, password, status, user_type_id, email, logged_in, terms, last_login FROM USER WHERE USER_ID = " + user_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
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
			throw( e );
		}
		finally {
			if( rs != null ) try { rs.close(); } catch( Exception f ) {}
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
		}
		return( obj );
	}

	public int putRecord( Long user_id, String handle, String password, String status, Integer user_type_id, String email, String logged_in, String terms, Date last_login ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE USER SET " );
		if( handle != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "HANDLE = ?" );
			count++;
		}
		if( password != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PASSWORD = ?" );
			count++;
		}
		if( status != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "STATUS = ?" );
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
			update.append( "EMAIL = ?" );
			count++;
		}
		if( logged_in != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "LOGGED_IN = ?" );
			count++;
		}
		if( terms != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "TERMS = ?" );
			count++;
		}
		if( last_login != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "LAST_LOGIN = ?" );
			count++;
		}
		update.append( " WHERE USER_ID = " + user_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( handle != null )
				ps.setString( index++, handle );
			if( password != null )
				ps.setString( index++, password );
			if( status != null )
				ps.setString( index++, status );
			if( email != null )
				ps.setString( index++, email );
			if( logged_in != null )
				ps.setString( index++, logged_in );
			if( terms != null )
				ps.setString( index++, terms );
			if( last_login != null )
				ps.setDate( index++, last_login );
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
		String	query = "SELECT USER_ID FROM USER";

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
