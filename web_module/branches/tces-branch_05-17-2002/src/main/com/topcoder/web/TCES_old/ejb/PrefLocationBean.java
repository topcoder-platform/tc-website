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
import	com.topcoder.web.TCES.ejb.PrefLocation;
import	com.topcoder.web.TCES.ejb.PrefLocationObject;

public class PrefLocationBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public String getKey( Integer profile_id ) {
		String	key = "";

		key += fmt0.format( profile_id );
		return( key );
	}

	public String getKey( PrefLocationObject obj ) {
		return( getKey( obj.profile_id ) );
	}

	public void create( Integer profile_id, Integer location_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PREF_LOCATION VALUES (  " + profile_id + ", " + location_id + " )";

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
		String	delete = "DELETE FROM PREF_LOCATION WHERE PROFILE_ID = " + profile_id;
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

	public PrefLocationObject request( int cmd, PrefLocationObject obj ) throws SQLException {

		switch( cmd ) {

		case PrefLocation.INSERT:
			create( obj.profile_id, obj.location_id );
			break;

		case PrefLocation.SELECT:
			obj = getRecord( obj.profile_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case PrefLocation.UPDATE:
			putRecord( obj.profile_id, obj.location_id );
			break;

		case PrefLocation.DELETE:
			delete( obj.profile_id );
			break;

		}
		return( obj );
	}

	public void setLocationId( Integer profile_id, Integer location_id ) throws SQLException {
		putRecord( profile_id, location_id );
	}

	public Integer getLocationId( Integer profile_id ) throws SQLException {
		PrefLocationObject	obj = null;
		Integer	result;

		obj = getRecord( profile_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.location_id );
	}

	private class RecordNotFoundException extends Exception {}

	private PrefLocationObject getRecord( Integer profile_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		String	key = getKey( profile_id );
		PrefLocationObject	obj = null;

		obj = new PrefLocationObject();
		String	query = "SELECT profile_id, location_id FROM PREF_LOCATION WHERE PROFILE_ID = " + profile_id;
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
			obj.location_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.location_id = null;
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

	public int putRecord(Integer profile_id, Integer location_id ) throws SQLException {
		String	identifier = getKey( profile_id );
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PREF_LOCATION SET " );
		if( location_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "LOCATION_ID = " + location_id.intValue() );
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
		String	query = "SELECT PROFILE_ID FROM PREF_LOCATION";

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

	public String findByLocationId( Integer location_id ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = null;

		try {
			conn = getConnection();
			query = "SELECT PROFILE_ID FROM PREF_LOCATION WHERE LOCATION_ID = " + location_id;
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Integer( rs.getInt( 1 ) ) );
			rs.close();
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
