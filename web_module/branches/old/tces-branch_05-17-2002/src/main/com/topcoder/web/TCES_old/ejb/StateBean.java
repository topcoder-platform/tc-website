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
import	com.topcoder.web.TCES.ejb.State;
import	com.topcoder.web.TCES.ejb.StateObject;
import	com.topcoder.web.TCES.common.*;
import	com.topcoder.web.TCES.common.Lookup;

/**
 * This is the implementation of the State class.
 * @see com.topcoder.web.TCES.ejb.State
 * @author Phil Selby, May 22nd, 2002
 */

public class StateBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;

	public void create( java.sql.Connection conn, String state_code, String state_name, String region_code, Integer demographic_decline ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO STATE VALUES (  '" + state_code + "', '" + state_name + "', '" + region_code + "', " + demographic_decline + " )";

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

	public void create( String state_code, String state_name, String region_code, Integer demographic_decline ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, state_code, state_name, region_code, demographic_decline );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( String state_code ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM STATE WHERE STATE_CODE = '" + state_code + "'";
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

	public StateObject request( int cmd, StateObject obj ) throws SQLException {

		switch( cmd ) {

		case State.INSERT:
			create( obj.state_code, obj.state_name, obj.region_code, obj.demographic_decline );
			break;

		case State.SELECT:
			obj = getRecord( obj.state_code );
			break;

		case State.UPDATE:
			putRecord( obj.state_code, obj.state_name, obj.region_code, obj.demographic_decline );
			break;

		case State.DELETE:
			delete( obj.state_code );
			break;

		}
		return( obj );
	}

	public void setStateName( String state_code, String state_name ) throws SQLException {
		putRecord( state_code, state_name, null, null );
	}

	public String getStateName( String state_code ) throws SQLException {
		return( ( (StateObject) getRecord( state_code ) ).state_name );
	}

	public void setRegionCode( String state_code, String region_code ) throws SQLException {
		putRecord( state_code, null, region_code, null );
	}

	public String getRegionCode( String state_code ) throws SQLException {
		return( ( (StateObject) getRecord( state_code ) ).region_code );
	}

	public void setDemographicDecline( String state_code, Integer demographic_decline ) throws SQLException {
		putRecord( state_code, null, null, demographic_decline );
	}

	public Integer getDemographicDecline( String state_code ) throws SQLException {
		return( ( (StateObject) getRecord( state_code ) ).demographic_decline );
	}

	private StateObject getRecord( String state_code ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		StateObject	obj = null;

		obj = new StateObject();
		String	query = "SELECT state_code, state_name, region_code, demographic_decline FROM STATE WHERE STATE_CODE = '" + state_code + "'";
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.state_code = rs.getString( 1 );
			if( rs.wasNull() )
				obj.state_code = null;
			obj.state_name = rs.getString( 2 );
			if( rs.wasNull() )
				obj.state_name = null;
			obj.region_code = rs.getString( 3 );
			if( rs.wasNull() )
				obj.region_code = null;
			obj.demographic_decline = new Integer( rs.getInt( 4 ) );
			if( rs.wasNull() )
				obj.demographic_decline = null;
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

	public int putRecord( String state_code, String state_name, String region_code, Integer demographic_decline ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE STATE SET " );
		if( state_name != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "STATE_NAME = ?" );
			count++;
		}
		if( region_code != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "REGION_CODE = ?" );
			count++;
		}
		if( demographic_decline != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "DEMOGRAPHIC_DECLINE = " + demographic_decline.intValue() );
			count++;
		}
		update.append( " WHERE STATE_CODE = '" + state_code + "'" );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( state_name != null )
				ps.setString( index++, state_name );
			if( region_code != null )
				ps.setString( index++, region_code );
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
		String	query = "SELECT STATE_CODE FROM STATE";

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

	public Lookup listStateCodeStateName() throws SQLException {
		Connection	conn = null;
		Statement	stmt = null;
		ResultSet	rs = null;
		String		query = "SELECT STATE_CODE, STATE_NAME FROM STATE";
		Lookup		result = new Lookup();

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery( query );
			while( rs.next() )
				result.addPair( rs.getString( 1 ),
				  rs.getString( 2 ) );
		}
		catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( rs != null ) try { rs.close(); } catch( Exception e ) {};
			if( stmt != null ) try { stmt.close(); } catch( Exception e ) {};
			if( conn != null ) try { conn.close(); } catch( Exception e ) {};
		}
		return( result );
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
