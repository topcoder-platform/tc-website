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
import	com.topcoder.web.TCES.ejb.OrganizationSizeLu;
import	com.topcoder.web.TCES.ejb.OrganizationSizeLuObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the OrganizationSizeLu class.
 * @see com.topcoder.web.TCES.ejb.OrganizationSizeLu
 * @author Phil Selby, May 22nd, 2002
 */

public class OrganizationSizeLuBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	private static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer organization_size_id, String organization_size_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO ORGANIZATION_SIZE_LU VALUES (  " + organization_size_id + ", '" + organization_size_desc + "' )";

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

	public void create( Integer organization_size_id, String organization_size_desc ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, organization_size_id, organization_size_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Integer organization_size_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM ORGANIZATION_SIZE_LU WHERE ORGANIZATION_SIZE_ID = " + organization_size_id;
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

	public OrganizationSizeLuObject request( int cmd, OrganizationSizeLuObject obj ) throws SQLException {

		switch( cmd ) {

		case OrganizationSizeLu.INSERT:
			create( obj.organization_size_id, obj.organization_size_desc );
			break;

		case OrganizationSizeLu.SELECT:
			obj = getRecord( obj.organization_size_id );
			break;

		case OrganizationSizeLu.UPDATE:
			putRecord( obj.organization_size_id, obj.organization_size_desc );
			break;

		case OrganizationSizeLu.DELETE:
			delete( obj.organization_size_id );
			break;

		}
		return( obj );
	}

	public void setOrganizationSizeDesc( Integer organization_size_id, String organization_size_desc ) throws SQLException {
		putRecord( organization_size_id, organization_size_desc );
	}

	public String getOrganizationSizeDesc( Integer organization_size_id ) throws SQLException {
		return( ( (OrganizationSizeLuObject) getRecord( organization_size_id ) ).organization_size_desc );
	}

	private OrganizationSizeLuObject getRecord( Integer organization_size_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		OrganizationSizeLuObject	obj = null;

		obj = new OrganizationSizeLuObject();
		String	query = "SELECT organization_size_id, organization_size_desc FROM ORGANIZATION_SIZE_LU WHERE ORGANIZATION_SIZE_ID = " + organization_size_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.organization_size_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.organization_size_id = null;
			obj.organization_size_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.organization_size_desc = null;
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

	public int putRecord( Integer organization_size_id, String organization_size_desc ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE ORGANIZATION_SIZE_LU SET " );
		if( organization_size_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "ORGANIZATION_SIZE_DESC = ?" );
			count++;
		}
		update.append( " WHERE ORGANIZATION_SIZE_ID = " + organization_size_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( organization_size_desc != null )
				ps.setString( index++, organization_size_desc );
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
		String	query = "SELECT ORGANIZATION_SIZE_ID FROM ORGANIZATION_SIZE_LU";

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
		String	query = "SELECT ORGANIZATION_SIZE_ID, organization_size_desc FROM ORGANIZATION_SIZE_LU";

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
