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
import	com.topcoder.web.TCES.ejb.Gpa;
import	com.topcoder.web.TCES.ejb.GpaObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the Gpa class.
 * @see com.topcoder.web.TCES.ejb.Gpa
 * @author Phil Selby, May 22nd, 2002
 */

public class GpaBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	private static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer gpa_id, Integer gpa_type_id, String gpa_desc, Integer gpa_value ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO GPA VALUES (  " + gpa_id + ", " + gpa_type_id + ", '" + gpa_desc + "', " + gpa_value + " )";

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

	public void create( Integer gpa_id, Integer gpa_type_id, String gpa_desc, Integer gpa_value ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, gpa_id, gpa_type_id, gpa_desc, gpa_value );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Integer gpa_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM GPA WHERE GPA_ID = " + gpa_id;
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

	public GpaObject request( int cmd, GpaObject obj ) throws SQLException {

		switch( cmd ) {

		case Gpa.INSERT:
			create( obj.gpa_id, obj.gpa_type_id, obj.gpa_desc, obj.gpa_value );
			break;

		case Gpa.SELECT:
			obj = getRecord( obj.gpa_id );
			break;

		case Gpa.UPDATE:
			putRecord( obj.gpa_id, obj.gpa_type_id, obj.gpa_desc, obj.gpa_value );
			break;

		case Gpa.DELETE:
			delete( obj.gpa_id );
			break;

		}
		return( obj );
	}

	public void setGpaTypeId( Integer gpa_id, Integer gpa_type_id ) throws SQLException {
		putRecord( gpa_id, gpa_type_id, null, null );
	}

	public Integer getGpaTypeId( Integer gpa_id ) throws SQLException {
		return( ( (GpaObject) getRecord( gpa_id ) ).gpa_type_id );
	}

	public void setGpaDesc( Integer gpa_id, String gpa_desc ) throws SQLException {
		putRecord( gpa_id, null, gpa_desc, null );
	}

	public String getGpaDesc( Integer gpa_id ) throws SQLException {
		return( ( (GpaObject) getRecord( gpa_id ) ).gpa_desc );
	}

	public void setGpaValue( Integer gpa_id, Integer gpa_value ) throws SQLException {
		putRecord( gpa_id, null, null, gpa_value );
	}

	public Integer getGpaValue( Integer gpa_id ) throws SQLException {
		return( ( (GpaObject) getRecord( gpa_id ) ).gpa_value );
	}

	private GpaObject getRecord( Integer gpa_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		GpaObject	obj = null;

		obj = new GpaObject();
		String	query = "SELECT gpa_id, gpa_type_id, gpa_desc, gpa_value FROM GPA WHERE GPA_ID = " + gpa_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.gpa_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.gpa_id = null;
			obj.gpa_type_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.gpa_type_id = null;
			obj.gpa_desc = rs.getString( 3 );
			if( rs.wasNull() )
				obj.gpa_desc = null;
			obj.gpa_value = new Integer( rs.getInt( 4 ) );
			if( rs.wasNull() )
				obj.gpa_value = null;
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

	public int putRecord( Integer gpa_id, Integer gpa_type_id, String gpa_desc, Integer gpa_value ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE GPA SET " );
		if( gpa_type_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "GPA_TYPE_ID = " + gpa_type_id.intValue() );
			count++;
		}
		if( gpa_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "GPA_DESC = ?" );
			count++;
		}
		if( gpa_value != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "GPA_VALUE = " + gpa_value.intValue() );
			count++;
		}
		update.append( " WHERE GPA_ID = " + gpa_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( gpa_desc != null )
				ps.setString( index++, gpa_desc );
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
		String	query = "SELECT GPA_ID FROM GPA";

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
