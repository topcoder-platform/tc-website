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
import	com.topcoder.web.TCES.ejb.Profile;
import	com.topcoder.web.TCES.ejb.ProfileObject;

public class ProfileBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public String getKey( Integer profile_id ) {
		String	key = "";

		key += fmt0.format( profile_id );
		return( key );
	}

	public String getKey( ProfileObject obj ) {
		return( getKey( obj.profile_id ) );
	}

	public void create( Integer profile_id, Integer coder_id, Integer status_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PROFILE VALUES (  " + profile_id + ", " + coder_id + ", " + status_id + " )";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( insert );
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

	public void delete( Integer profile_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM PROFILE WHERE PROFILE_ID = " + profile_id;
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

	public ProfileObject request( int cmd, ProfileObject obj ) throws SQLException {

		switch( cmd ) {

		case Profile.INSERT:
			create( obj.profile_id, obj.coder_id, obj.status_id );
			break;

		case Profile.SELECT:
			obj = getRecord( obj.profile_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case Profile.UPDATE:
			putRecord( obj.profile_id, obj.coder_id, obj.status_id );
			break;

		case Profile.DELETE:
			delete( obj.profile_id );
			break;

		}
		return( obj );
	}

	public void setCoderId( Integer profile_id, Integer coder_id ) throws SQLException {
		putRecord( profile_id, coder_id, null );
	}

	public Integer getCoderId( Integer profile_id ) throws SQLException {
		ProfileObject	obj = null;
		Integer	result;

		obj = getRecord( profile_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.coder_id );
	}

	public void setStatusId( Integer profile_id, Integer status_id ) throws SQLException {
		putRecord( profile_id, null, status_id );
	}

	public Integer getStatusId( Integer profile_id ) throws SQLException {
		ProfileObject	obj = null;
		Integer	result;

		obj = getRecord( profile_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.status_id );
	}

	private class RecordNotFoundException extends Exception {}

	private ProfileObject getRecord( Integer profile_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		String	key = getKey( profile_id );
		ProfileObject	obj = null;

		obj = new ProfileObject();
		String	query = "SELECT profile_id, coder_id, status_id FROM PROFILE WHERE PROFILE_ID = " + profile_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.profile_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.profile_id = null;
			obj.coder_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.coder_id = null;
			obj.status_id = new Integer( rs.getInt( 3 ) );
			if( rs.wasNull() )
				obj.status_id = null;
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

	public int putRecord(Integer profile_id, Integer coder_id, Integer status_id ) throws SQLException {
		String	identifier = getKey( profile_id );
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PROFILE SET " );
		if( coder_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "CODER_ID = " + coder_id.intValue() );
			count++;
		}
		if( status_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "STATUS_ID = " + status_id.intValue() );
			count++;
		}
		update.append( " WHERE PROFILE_ID = " + profile_id );
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
		String	query = "SELECT PROFILE_ID FROM PROFILE";

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
