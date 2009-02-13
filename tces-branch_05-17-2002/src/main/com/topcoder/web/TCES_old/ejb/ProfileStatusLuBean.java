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
import	com.topcoder.web.TCES.ejb.ProfileStatusLu;
import	com.topcoder.web.TCES.ejb.ProfileStatusLuObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the ProfileStatusLu class.
 * @see com.topcoder.web.TCES.ejb.ProfileStatusLu
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileStatusLuBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
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
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, profile_status_id, profile_status_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Integer profile_status_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM PROFILE_STATUS_LU WHERE PROFILE_STATUS_ID = " + profile_status_id;
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

	public void setProfileStatusDesc( Integer profile_status_id, String profile_status_desc ) throws SQLException {
		putRecord( profile_status_id, profile_status_desc );
	}

	public String getProfileStatusDesc( Integer profile_status_id ) throws SQLException {
		return( ( (ProfileStatusLuObject) getRecord( profile_status_id ) ).profile_status_desc );
	}

	private ProfileStatusLuObject getRecord( Integer profile_status_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		ProfileStatusLuObject	obj = null;

		obj = new ProfileStatusLuObject();
		String	query = "SELECT profile_status_id, profile_status_desc FROM PROFILE_STATUS_LU WHERE PROFILE_STATUS_ID = " + profile_status_id;
		InputStream	is = null;

		try {
			conn = getConnection();
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
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
		}
		return( obj );
	}

	public int putRecord( Integer profile_status_id, String profile_status_desc ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
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
			conn = getConnection();
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
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
		}
		return( rc );
	}

	public String list() throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = "SELECT PROFILE_STATUS_ID FROM PROFILE_STATUS_LU";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Integer( rs.getInt( 1 ) ) );
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
		}
		return( flatten( results ) );
	}

	public Hashtable listContent() throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Hashtable	results = new Hashtable();
		String	query = "SELECT PROFILE_STATUS_ID, profile_status_desc FROM PROFILE_STATUS_LU";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.put( new Integer( rs.getInt( 1 ) ), rs.getString( 2 ) );
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
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
