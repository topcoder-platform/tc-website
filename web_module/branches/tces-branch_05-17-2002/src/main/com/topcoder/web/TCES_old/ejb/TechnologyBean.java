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
import	com.topcoder.web.TCES.ejb.Technology;
import	com.topcoder.web.TCES.ejb.TechnologyObject;

public class TechnologyBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public String getKey( Integer technology_id ) {
		String	key = "";

		key += fmt0.format( technology_id );
		return( key );
	}

	public String getKey( TechnologyObject obj ) {
		return( getKey( obj.technology_id ) );
	}

	public void create( Integer technology_id, String description ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO TECHNOLOGY VALUES (  " + technology_id + ", '" + description + "' )";

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

	public void delete( Integer technology_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM TECHNOLOGY WHERE TECHNOLOGY_ID = " + technology_id;
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

	public TechnologyObject request( int cmd, TechnologyObject obj ) throws SQLException {

		switch( cmd ) {

		case Technology.INSERT:
			create( obj.technology_id, obj.description );
			break;

		case Technology.SELECT:
			obj = getRecord( obj.technology_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case Technology.UPDATE:
			putRecord( obj.technology_id, obj.description );
			break;

		case Technology.DELETE:
			delete( obj.technology_id );
			break;

		}
		return( obj );
	}

	public void setDescription( Integer technology_id, String description ) throws SQLException {
		putRecord( technology_id, description );
	}

	public String getDescription( Integer technology_id ) throws SQLException {
		TechnologyObject	obj = null;
		String	result;

		obj = getRecord( technology_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.description );
	}

	private class RecordNotFoundException extends Exception {}

	private TechnologyObject getRecord( Integer technology_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		String	key = getKey( technology_id );
		TechnologyObject	obj = null;

		obj = new TechnologyObject();
		String	query = "SELECT technology_id, description FROM TECHNOLOGY WHERE TECHNOLOGY_ID = " + technology_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.technology_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.technology_id = null;
			obj.description = rs.getString( 2 );
			if( rs.wasNull() )
				obj.description = null;
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

	public int putRecord(Integer technology_id, String description ) throws SQLException {
		String	identifier = getKey( technology_id );
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE TECHNOLOGY SET " );
		if( description != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "DESCRIPTION = '" + description + "'" );
			count++;
		}
		update.append( " WHERE TECHNOLOGY_ID = " + technology_id );
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
		String	query = "SELECT TECHNOLOGY_ID FROM TECHNOLOGY";

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
