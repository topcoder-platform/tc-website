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
import	com.topcoder.web.TCES.ejb.LocationLuObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the LocationLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public class LocationLu {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public LocationLu( Connection conn ) {
		this.conn = conn;
	}

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
		try {
			create( conn, location_id, location_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Integer location_id ) throws SQLException {
		String	delete = "DELETE FROM LOCATION_LU WHERE LOCATION_ID = " + location_id;
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

	/**
	 * Set the location_desc field in the location_lu table corresponding to the given key.
	 * @param location_id the table primary key
	 * @param location_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setLocationDesc( Integer location_id, String location_desc ) throws SQLException {
		putRecord( location_id, location_desc );
	}

	/**
	 * Get the location_desc field from the location_lu table corresponding to the given key.
	 * @param location_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getLocationDesc( Integer location_id ) throws SQLException {
		return( ( (LocationLuObject) getRecord( location_id ) ).location_desc );
	}

	private LocationLuObject getRecord( Integer location_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		LocationLuObject	obj = null;

		obj = new LocationLuObject();
		String	query = "SELECT location_id, location_desc FROM LOCATION_LU WHERE LOCATION_ID = " + location_id;
		InputStream	is = null;

		try {
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
		}
		return( obj );
	}

	public int putRecord( Integer location_id, String location_desc ) throws SQLException {
		PreparedStatement	ps = null;
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
		}
		return( rc );
	}

	public String list() throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = "SELECT LOCATION_ID FROM LOCATION_LU";

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
		String	query = "SELECT LOCATION_ID, location_desc FROM LOCATION_LU";

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
