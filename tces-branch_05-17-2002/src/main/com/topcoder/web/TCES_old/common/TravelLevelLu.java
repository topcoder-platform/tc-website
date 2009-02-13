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
import	com.topcoder.web.TCES.ejb.TravelLevelLuObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the TravelLevelLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public class TravelLevelLu {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public TravelLevelLu( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer travel_level_id, String travel_level_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO TRAVEL_LEVEL_LU VALUES (  " + travel_level_id + ", '" + travel_level_desc + "' )";

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

	public void create( Integer travel_level_id, String travel_level_desc ) throws SQLException {
		try {
			create( conn, travel_level_id, travel_level_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Integer travel_level_id ) throws SQLException {
		String	delete = "DELETE FROM TRAVEL_LEVEL_LU WHERE TRAVEL_LEVEL_ID = " + travel_level_id;
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

	public TravelLevelLuObject request( int cmd, TravelLevelLuObject obj ) throws SQLException {

		switch( cmd ) {

		case TravelLevelLu.INSERT:
			create( obj.travel_level_id, obj.travel_level_desc );
			break;

		case TravelLevelLu.SELECT:
			obj = getRecord( obj.travel_level_id );
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

	/**
	 * Set the travel_level_desc field in the travel_level_lu table corresponding to the given key.
	 * @param travel_level_id the table primary key
	 * @param travel_level_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setTravelLevelDesc( Integer travel_level_id, String travel_level_desc ) throws SQLException {
		putRecord( travel_level_id, travel_level_desc );
	}

	/**
	 * Get the travel_level_desc field from the travel_level_lu table corresponding to the given key.
	 * @param travel_level_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getTravelLevelDesc( Integer travel_level_id ) throws SQLException {
		return( ( (TravelLevelLuObject) getRecord( travel_level_id ) ).travel_level_desc );
	}

	private TravelLevelLuObject getRecord( Integer travel_level_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		TravelLevelLuObject	obj = null;

		obj = new TravelLevelLuObject();
		String	query = "SELECT travel_level_id, travel_level_desc FROM TRAVEL_LEVEL_LU WHERE TRAVEL_LEVEL_ID = " + travel_level_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.travel_level_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.travel_level_id = null;
			obj.travel_level_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.travel_level_desc = null;
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

	public int putRecord( Integer travel_level_id, String travel_level_desc ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE TRAVEL_LEVEL_LU SET " );
		if( travel_level_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "TRAVEL_LEVEL_DESC = ?" );
			count++;
		}
		update.append( " WHERE TRAVEL_LEVEL_ID = " + travel_level_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( travel_level_desc != null )
				ps.setString( index++, travel_level_desc );
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
		String	query = "SELECT TRAVEL_LEVEL_ID FROM TRAVEL_LEVEL_LU";

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
		String	query = "SELECT TRAVEL_LEVEL_ID, travel_level_desc FROM TRAVEL_LEVEL_LU";

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
