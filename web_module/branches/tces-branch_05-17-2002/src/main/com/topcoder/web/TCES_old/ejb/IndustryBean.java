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
import	com.topcoder.web.TCES.ejb.Industry;
import	com.topcoder.web.TCES.ejb.IndustryObject;

public class IndustryBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public String getKey( Integer industry_id ) {
		String	key = "";

		key += fmt0.format( industry_id );
		return( key );
	}

	public String getKey( IndustryObject obj ) {
		return( getKey( obj.industry_id ) );
	}

	public void create( Integer industry_id, String description ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO INDUSTRY VALUES (  " + industry_id + ", '" + description + "' )";

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

	public void delete( Integer industry_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM INDUSTRY WHERE INDUSTRY_ID = " + industry_id;
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

	public IndustryObject request( int cmd, IndustryObject obj ) throws SQLException {

		switch( cmd ) {

		case Industry.INSERT:
			create( obj.industry_id, obj.description );
			break;

		case Industry.SELECT:
			obj = getRecord( obj.industry_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case Industry.UPDATE:
			putRecord( obj.industry_id, obj.description );
			break;

		case Industry.DELETE:
			delete( obj.industry_id );
			break;

		}
		return( obj );
	}

	public void setDescription( Integer industry_id, String description ) throws SQLException {
		putRecord( industry_id, description );
	}

	public String getDescription( Integer industry_id ) throws SQLException {
		IndustryObject	obj = null;
		String	result;

		obj = getRecord( industry_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.description );
	}

	private class RecordNotFoundException extends Exception {}

	private IndustryObject getRecord( Integer industry_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		String	key = getKey( industry_id );
		IndustryObject	obj = null;

		obj = new IndustryObject();
		String	query = "SELECT industry_id, description FROM INDUSTRY WHERE INDUSTRY_ID = " + industry_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.industry_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.industry_id = null;
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

	public int putRecord(Integer industry_id, String description ) throws SQLException {
		String	identifier = getKey( industry_id );
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE INDUSTRY SET " );
		if( description != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "DESCRIPTION = '" + description + "'" );
			count++;
		}
		update.append( " WHERE INDUSTRY_ID = " + industry_id );
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
		String	query = "SELECT INDUSTRY_ID FROM INDUSTRY";

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
