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
import	com.topcoder.web.TCES.ejb.ProfileStatusLuObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the ProfileStatusLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileStatusLu {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public ProfileStatusLu( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer profile_status_id, String profile_status_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PROFILE_STATUS_LU VALUES (  " + profile_status_id + ", '" + profile_status_desc + "' )";

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

	public void create( Integer profile_status_id, String profile_status_desc ) throws SQLException {
		try {
			create( conn, profile_status_id, profile_status_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Integer profile_status_id ) throws SQLException {
		String	delete = "DELETE FROM PROFILE_STATUS_LU WHERE PROFILE_STATUS_ID = " + profile_status_id;
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

	public ProfileStatusLuObject request( int cmd, ProfileStatusLuObject obj ) throws SQLException {

		switch( cmd ) {

		case ProfileStatusLu.INSERT:
			create( obj.profile_status_id, obj.profile_status_desc );
			break;

		case ProfileStatusLu.SELECT:
			obj = getRecord( obj.profile_status_id );
			break;

		case ProfileStatusLu.UPDATE:
			putRecord( obj.profile_status_id, obj.profile_status_desc );
			break;

		case ProfileStatusLu.DELETE:
			delete( obj.profile_status_id );
			break;

		}
		return( obj );
	}

	/**
	 * Set the profile_status_desc field in the profile_status_lu table corresponding to the given key.
	 * @param profile_status_id the table primary key
	 * @param profile_status_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileStatusDesc( Integer profile_status_id, String profile_status_desc ) throws SQLException {
		putRecord( profile_status_id, profile_status_desc );
	}

	/**
	 * Get the profile_status_desc field from the profile_status_lu table corresponding to the given key.
	 * @param profile_status_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getProfileStatusDesc( Integer profile_status_id ) throws SQLException {
		return( ( (ProfileStatusLuObject) getRecord( profile_status_id ) ).profile_status_desc );
	}

	private ProfileStatusLuObject getRecord( Integer profile_status_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		ProfileStatusLuObject	obj = null;

		obj = new ProfileStatusLuObject();
		String	query = "SELECT profile_status_id, profile_status_desc FROM PROFILE_STATUS_LU WHERE PROFILE_STATUS_ID = " + profile_status_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.profile_status_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.profile_status_id = null;
			obj.profile_status_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.profile_status_desc = null;
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

	public int putRecord( Integer profile_status_id, String profile_status_desc ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PROFILE_STATUS_LU SET " );
		if( profile_status_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PROFILE_STATUS_DESC = ?" );
			count++;
		}
		update.append( " WHERE PROFILE_STATUS_ID = " + profile_status_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( profile_status_desc != null )
				ps.setString( index++, profile_status_desc );
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
		String	query = "SELECT PROFILE_STATUS_ID FROM PROFILE_STATUS_LU";

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Integer( rs.getInt( 1 ) ) );
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
		}
		return( flatten( results ) );
	}

	public Hashtable listContent() throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Hashtable	results = new Hashtable();
		String	query = "SELECT PROFILE_STATUS_ID, profile_status_desc FROM PROFILE_STATUS_LU";

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.put( new Integer( rs.getInt( 1 ) ), rs.getString( 2 ) );
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
		}
		return( results );
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
