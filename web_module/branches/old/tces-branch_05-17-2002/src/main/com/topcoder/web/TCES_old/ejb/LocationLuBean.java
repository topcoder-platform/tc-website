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
import	com.topcoder.web.TCES.ejb.LocationLu;
import	com.topcoder.web.TCES.ejb.LocationLuObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the LocationLu class.
 * @see com.topcoder.web.TCES.ejb.LocationLu
 * @author Phil Selby, May 22nd, 2002
 */

public class LocationLuBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	private static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer location_id, String location_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO LOCATION_LU VALUES (  " + location_id + ", '" + location_desc + "' )";

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

	public void create( Integer location_id, String location_desc ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, location_id, location_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Integer location_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM LOCATION_LU WHERE LOCATION_ID = " + location_id;
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

	public LocationLuObject request( int cmd, LocationLuObject obj ) throws SQLException {

		switch( cmd ) {

		case LocationLu.INSERT:
			create( obj.location_id, obj.location_desc );
			break;

		case LocationLu.SELECT:
			obj = getRecord( obj.location_id );
			break;

		case LocationLu.UPDATE:
			putRecord( obj.location_id, obj.location_desc );
			break;

		case LocationLu.DELETE:
			delete( obj.location_id );
			break;

		}
		return( obj );
	}

	public void setLocationDesc( Integer location_id, String location_desc ) throws SQLException {
		putRecord( location_id, location_desc );
	}

	public String getLocationDesc( Integer location_id ) throws SQLException {
		return( ( (LocationLuObject) getRecord( location_id ) ).location_desc );
	}

	private LocationLuObject getRecord( Integer location_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		LocationLuObject	obj = null;

		obj = new LocationLuObject();
		String	query = "SELECT location_id, location_desc FROM LOCATION_LU WHERE LOCATION_ID = " + location_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.location_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.location_id = null;
			obj.location_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.location_desc = null;
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

	public int putRecord( Integer location_id, String location_desc ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE LOCATION_LU SET " );
		if( location_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "LOCATION_DESC = ?" );
			count++;
		}
		update.append( " WHERE LOCATION_ID = " + location_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( location_desc != null )
				ps.setString( index++, location_desc );
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
		String	query = "SELECT LOCATION_ID FROM LOCATION_LU";

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
		String	query = "SELECT LOCATION_ID, location_desc FROM LOCATION_LU";

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
