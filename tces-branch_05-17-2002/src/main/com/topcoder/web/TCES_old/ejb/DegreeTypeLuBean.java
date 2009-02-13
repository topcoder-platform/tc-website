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
import	com.topcoder.web.TCES.ejb.DegreeTypeLu;
import	com.topcoder.web.TCES.ejb.DegreeTypeLuObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the DegreeTypeLu class.
 * @see com.topcoder.web.TCES.ejb.DegreeTypeLu
 * @author Phil Selby, May 22nd, 2002
 */

public class DegreeTypeLuBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	private static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer degree_type_id, String degree_type_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO DEGREE_TYPE_LU VALUES (  " + degree_type_id + ", '" + degree_type_desc + "' )";

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

	public void create( Integer degree_type_id, String degree_type_desc ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, degree_type_id, degree_type_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Integer degree_type_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM DEGREE_TYPE_LU WHERE DEGREE_TYPE_ID = " + degree_type_id;
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

	public DegreeTypeLuObject request( int cmd, DegreeTypeLuObject obj ) throws SQLException {

		switch( cmd ) {

		case DegreeTypeLu.INSERT:
			create( obj.degree_type_id, obj.degree_type_desc );
			break;

		case DegreeTypeLu.SELECT:
			obj = getRecord( obj.degree_type_id );
			break;

		case DegreeTypeLu.UPDATE:
			putRecord( obj.degree_type_id, obj.degree_type_desc );
			break;

		case DegreeTypeLu.DELETE:
			delete( obj.degree_type_id );
			break;

		}
		return( obj );
	}

	public void setDegreeTypeDesc( Integer degree_type_id, String degree_type_desc ) throws SQLException {
		putRecord( degree_type_id, degree_type_desc );
	}

	public String getDegreeTypeDesc( Integer degree_type_id ) throws SQLException {
		return( ( (DegreeTypeLuObject) getRecord( degree_type_id ) ).degree_type_desc );
	}

	private DegreeTypeLuObject getRecord( Integer degree_type_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		DegreeTypeLuObject	obj = null;

		obj = new DegreeTypeLuObject();
		String	query = "SELECT degree_type_id, degree_type_desc FROM DEGREE_TYPE_LU WHERE DEGREE_TYPE_ID = " + degree_type_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.degree_type_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.degree_type_id = null;
			obj.degree_type_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.degree_type_desc = null;
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

	public int putRecord( Integer degree_type_id, String degree_type_desc ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE DEGREE_TYPE_LU SET " );
		if( degree_type_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "DEGREE_TYPE_DESC = ?" );
			count++;
		}
		update.append( " WHERE DEGREE_TYPE_ID = " + degree_type_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( degree_type_desc != null )
				ps.setString( index++, degree_type_desc );
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
		String	query = "SELECT DEGREE_TYPE_ID FROM DEGREE_TYPE_LU";

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
		String	query = "SELECT DEGREE_TYPE_ID, degree_type_desc FROM DEGREE_TYPE_LU";

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
