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
import	com.topcoder.web.TCES.ejb.TravelTimeLu;
import	com.topcoder.web.TCES.ejb.TravelTimeLuObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the TravelTimeLu class.
 * @see com.topcoder.web.TCES.ejb.TravelTimeLu
 * @author Phil Selby, May 22nd, 2002
 */

public class TravelTimeLuBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	private static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer travel_time_id, String travel_time_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO TRAVEL_TIME_LU VALUES (  " + travel_time_id + ", '" + travel_time_desc + "' )";

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

	public void create( Integer travel_time_id, String travel_time_desc ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, travel_time_id, travel_time_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Integer travel_time_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM TRAVEL_TIME_LU WHERE TRAVEL_TIME_ID = " + travel_time_id;
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

	public TravelTimeLuObject request( int cmd, TravelTimeLuObject obj ) throws SQLException {

		switch( cmd ) {

		case TravelTimeLu.INSERT:
			create( obj.travel_time_id, obj.travel_time_desc );
			break;

		case TravelTimeLu.SELECT:
			obj = getRecord( obj.travel_time_id );
			break;

		case TravelTimeLu.UPDATE:
			putRecord( obj.travel_time_id, obj.travel_time_desc );
			break;

		case TravelTimeLu.DELETE:
			delete( obj.travel_time_id );
			break;

		}
		return( obj );
	}

	public void setTravelTimeDesc( Integer travel_time_id, String travel_time_desc ) throws SQLException {
		putRecord( travel_time_id, travel_time_desc );
	}

	public String getTravelTimeDesc( Integer travel_time_id ) throws SQLException {
		return( ( (TravelTimeLuObject) getRecord( travel_time_id ) ).travel_time_desc );
	}

	private TravelTimeLuObject getRecord( Integer travel_time_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		TravelTimeLuObject	obj = null;

		obj = new TravelTimeLuObject();
		String	query = "SELECT travel_time_id, travel_time_desc FROM TRAVEL_TIME_LU WHERE TRAVEL_TIME_ID = " + travel_time_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.travel_time_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.travel_time_id = null;
			obj.travel_time_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.travel_time_desc = null;
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

	public int putRecord( Integer travel_time_id, String travel_time_desc ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE TRAVEL_TIME_LU SET " );
		if( travel_time_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "TRAVEL_TIME_DESC = ?" );
			count++;
		}
		update.append( " WHERE TRAVEL_TIME_ID = " + travel_time_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( travel_time_desc != null )
				ps.setString( index++, travel_time_desc );
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
		String	query = "SELECT TRAVEL_TIME_ID FROM TRAVEL_TIME_LU";

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
		String	query = "SELECT TRAVEL_TIME_ID, travel_time_desc FROM TRAVEL_TIME_LU";

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
