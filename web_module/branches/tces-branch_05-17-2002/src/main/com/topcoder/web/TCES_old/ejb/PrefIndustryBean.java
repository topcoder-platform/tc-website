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
import	com.topcoder.web.TCES.ejb.PrefIndustry;
import	com.topcoder.web.TCES.ejb.PrefIndustryObject;

public class PrefIndustryBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public String getKey( Integer profile_id ) {
		String	key = "";

		key += fmt0.format( profile_id );
		return( key );
	}

	public String getKey( PrefIndustryObject obj ) {
		return( getKey( obj.profile_id ) );
	}

	public void create( Integer profile_id, Integer industry_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PREF_INDUSTRY VALUES (  " + profile_id + ", " + industry_id + " )";

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

	public void delete( Integer profile_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM PREF_INDUSTRY WHERE PROFILE_ID = " + profile_id;
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

	public PrefIndustryObject request( int cmd, PrefIndustryObject obj ) throws SQLException {

		switch( cmd ) {

		case PrefIndustry.INSERT:
			create( obj.profile_id, obj.industry_id );
			break;

		case PrefIndustry.SELECT:
			obj = getRecord( obj.profile_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case PrefIndustry.UPDATE:
			putRecord( obj.profile_id, obj.industry_id );
			break;

		case PrefIndustry.DELETE:
			delete( obj.profile_id );
			break;

		}
		return( obj );
	}

	public void setIndustryId( Integer profile_id, Integer industry_id ) throws SQLException {
		putRecord( profile_id, industry_id );
	}

	public Integer getIndustryId( Integer profile_id ) throws SQLException {
		PrefIndustryObject	obj = null;
		Integer	result;

		obj = getRecord( profile_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.industry_id );
	}

	private class RecordNotFoundException extends Exception {}

	private PrefIndustryObject getRecord( Integer profile_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		String	key = getKey( profile_id );
		PrefIndustryObject	obj = null;

		obj = new PrefIndustryObject();
		String	query = "SELECT profile_id, industry_id FROM PREF_INDUSTRY WHERE PROFILE_ID = " + profile_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.profile_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.profile_id = null;
			obj.industry_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.industry_id = null;
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

	public int putRecord(Integer profile_id, Integer industry_id ) throws SQLException {
		String	identifier = getKey( profile_id );
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PREF_INDUSTRY SET " );
		if( industry_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "INDUSTRY_ID = " + industry_id.intValue() );
			count++;
		}
		update.append( " WHERE PROFILE_ID = " + profile_id );
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
		String	query = "SELECT PROFILE_ID FROM PREF_INDUSTRY";

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

	public String findByIndustryId( Integer industry_id ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = null;

		try {
			conn = getConnection();
			query = "SELECT PROFILE_ID FROM PREF_INDUSTRY WHERE INDUSTRY_ID = " + industry_id;
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Integer( rs.getInt( 1 ) ) );
			rs.close();
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
