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
import	com.topcoder.web.TCES.ejb.TravelLevelLu;
import	com.topcoder.web.TCES.ejb.TravelLevelLuObject;

/**
 * This is the implementation of the TravelLevelLu class.
 * @see com.topcoder.web.TCES.ejb.TravelLevelLu
 * @author Phil Selby, May 22nd, 2002
 */

public class TravelLevelLuBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer travel_level_id, String travel_level_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO TRAVEL_LEVEL_LU VALUES (  " + travel_level_id + ", '" + travel_level_desc + "' )";

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

	public void create( Integer travel_level_id, String travel_level_desc ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, travel_level_id, travel_level_desc );
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

	public void delete( Integer travel_level_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM TRAVEL_LEVEL_LU WHERE TRAVEL_LEVEL_ID = " + travel_level_id;
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

	public TravelLevelLuObject request( int cmd, TravelLevelLuObject obj ) throws SQLException {

		switch( cmd ) {

		case TravelLevelLu.INSERT:
			create( obj.travel_level_id, obj.travel_level_desc );
			break;

		case TravelLevelLu.SELECT:
			obj = getRecord( obj.travel_level_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case TravelLevelLu.UPDATE:
			putRecord( obj.travel_level_id, obj.travel_level_desc );
			break;

		case TravelLevelLu.DELETE:
			delete( obj.travel_level_id );
			break;

		}
		return( obj );
	}

	public void setTravelLevelDesc( Integer travel_level_id, String travel_level_desc ) throws SQLException {
		putRecord( travel_level_id, travel_level_desc );
	}

	public String getTravelLevelDesc( Integer travel_level_id ) throws SQLException {
		TravelLevelLuObject	obj = null;
		String	result;

		obj = getRecord( travel_level_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.travel_level_desc );
	}

	private class RecordNotFoundException extends Exception {}

	private TravelLevelLuObject getRecord( Integer travel_level_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		TravelLevelLuObject	obj = null;

		obj = new TravelLevelLuObject();
		String	query = "SELECT travel_level_id, travel_level_desc FROM TRAVEL_LEVEL_LU WHERE TRAVEL_LEVEL_ID = " + travel_level_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.travel_level_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.travel_level_id = null;
			obj.travel_level_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.travel_level_desc = null;
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

	public int putRecord( Integer travel_level_id, String travel_level_desc ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE TRAVEL_LEVEL_LU SET " );
		if( travel_level_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "TRAVEL_LEVEL_DESC = '" + travel_level_desc + "'" );
			count++;
		}
		update.append( " WHERE TRAVEL_LEVEL_ID = " + travel_level_id );
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
		String	query = "SELECT TRAVEL_LEVEL_ID FROM TRAVEL_LEVEL_LU";

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

	public Hashtable listContent() throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Hashtable	results = new Hashtable();
		String	query = "SELECT TRAVEL_LEVEL_ID, travel_level_desc FROM TRAVEL_LEVEL_LU";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.put( new Integer( rs.getInt( 1 ) ), rs.getString( 2 ) );
		} catch( SQLException e ) {
			try { if( ps != null ) ps.close(); } catch( Exception f ) {}
			try { if( conn != null ) conn.close(); } catch( Exception f ) {}
			throw( e );
		}
		try { if( ps != null ) ps.close(); } catch( Exception f ) {}
		try { if( conn != null ) conn.close(); } catch( Exception f ) {}
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
