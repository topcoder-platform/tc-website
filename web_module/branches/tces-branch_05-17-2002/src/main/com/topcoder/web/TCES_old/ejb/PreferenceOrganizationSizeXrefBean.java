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
import	com.topcoder.web.TCES.ejb.PreferenceOrganizationSizeXref;
import	com.topcoder.web.TCES.ejb.PreferenceOrganizationSizeXrefObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the PreferenceOrganizationSizeXref class.
 * @see com.topcoder.web.TCES.ejb.PreferenceOrganizationSizeXref
 * @author Phil Selby, May 22nd, 2002
 */

public class PreferenceOrganizationSizeXrefBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	private static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );
	private static final DecimalFormat	fmt1 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Long profile_id, Integer organization_size_id ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PREFERENCE_ORGANIZATION_SIZE_XREF VALUES (  " + profile_id + ", " + organization_size_id + " )";

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

	public void create( Long profile_id, Integer organization_size_id ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, profile_id, organization_size_id );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Long profile_id, Integer organization_size_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM PREFERENCE_ORGANIZATION_SIZE_XREF WHERE PROFILE_ID = " + profile_id + " AND ORGANIZATION_SIZE_ID = " + organization_size_id;
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

	public PreferenceOrganizationSizeXrefObject request( int cmd, PreferenceOrganizationSizeXrefObject obj ) throws SQLException {

		switch( cmd ) {

		case PreferenceOrganizationSizeXref.INSERT:
			create( obj.profile_id, obj.organization_size_id );
			break;

		case PreferenceOrganizationSizeXref.SELECT:
			obj = getRecord( obj.profile_id, obj.organization_size_id );
			break;

		case PreferenceOrganizationSizeXref.UPDATE:
			putRecord( obj.profile_id, obj.organization_size_id );
			break;

		case PreferenceOrganizationSizeXref.DELETE:
			delete( obj.profile_id, obj.organization_size_id );
			break;

		}
		return( obj );
	}

	private PreferenceOrganizationSizeXrefObject getRecord( Long profile_id, Integer organization_size_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		PreferenceOrganizationSizeXrefObject	obj = null;

		obj = new PreferenceOrganizationSizeXrefObject();
		String	query = "SELECT profile_id, organization_size_id FROM PREFERENCE_ORGANIZATION_SIZE_XREF WHERE PROFILE_ID = " + profile_id + " AND ORGANIZATION_SIZE_ID = " + organization_size_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.profile_id = new Long( rs.getLong( 1 ) );
			if( rs.wasNull() )
				obj.profile_id = null;
			obj.organization_size_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.organization_size_id = null;
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

	public int putRecord( Long profile_id, Integer organization_size_id ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PREFERENCE_ORGANIZATION_SIZE_XREF SET " );
		update.append( " WHERE PROFILE_ID = " + profile_id + " AND ORGANIZATION_SIZE_ID = " + organization_size_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
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

	public Hashtable list() throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Hashtable	results = new Hashtable();
		String	query = "SELECT PROFILE_ID, ORGANIZATION_SIZE_ID FROM PREFERENCE_ORGANIZATION_SIZE_XREF";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.put( new Long( rs.getLong( 1 ) ), new Integer( rs.getInt( 2 ) ) );
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
		}
		return( results );
	}

	public String findByOrganizationSizeId( Integer organization_size_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = null;

		try {
			conn = getConnection();
			query = "SELECT PROFILE_ID FROM PREFERENCE_ORGANIZATION_SIZE_XREF WHERE ORGANIZATION_SIZE_ID = " + organization_size_id;
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Long( rs.getLong( 1 ) ) );
			rs.close();
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
