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
import	com.topcoder.web.TCES.ejb.PrefSalary;
import	com.topcoder.web.TCES.ejb.PrefSalaryObject;

public class PrefSalaryBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public String getKey( Integer profile_id ) {
		String	key = "";

		key += fmt0.format( profile_id );
		return( key );
	}

	public String getKey( PrefSalaryObject obj ) {
		return( getKey( obj.profile_id ) );
	}

	public void create( Integer profile_id, Integer salary_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PREF_SALARY VALUES (  " + profile_id + ", " + salary_id + " )";

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
		String	delete = "DELETE FROM PREF_SALARY WHERE PROFILE_ID = " + profile_id;
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

	public PrefSalaryObject request( int cmd, PrefSalaryObject obj ) throws SQLException {

		switch( cmd ) {

		case PrefSalary.INSERT:
			create( obj.profile_id, obj.salary_id );
			break;

		case PrefSalary.SELECT:
			obj = getRecord( obj.profile_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case PrefSalary.UPDATE:
			putRecord( obj.profile_id, obj.salary_id );
			break;

		case PrefSalary.DELETE:
			delete( obj.profile_id );
			break;

		}
		return( obj );
	}

	public void setSalaryId( Integer profile_id, Integer salary_id ) throws SQLException {
		putRecord( profile_id, salary_id );
	}

	public Integer getSalaryId( Integer profile_id ) throws SQLException {
		PrefSalaryObject	obj = null;
		Integer	result;

		obj = getRecord( profile_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.salary_id );
	}

	private class RecordNotFoundException extends Exception {}

	private PrefSalaryObject getRecord( Integer profile_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		String	key = getKey( profile_id );
		PrefSalaryObject	obj = null;

		obj = new PrefSalaryObject();
		String	query = "SELECT profile_id, salary_id FROM PREF_SALARY WHERE PROFILE_ID = " + profile_id;
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
			obj.salary_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.salary_id = null;
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

	public int putRecord(Integer profile_id, Integer salary_id ) throws SQLException {
		String	identifier = getKey( profile_id );
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PREF_SALARY SET " );
		if( salary_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SALARY_ID = " + salary_id.intValue() );
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
		String	query = "SELECT PROFILE_ID FROM PREF_SALARY";

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

	public String findBySalaryId( Integer salary_id ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = null;

		try {
			conn = getConnection();
			query = "SELECT PROFILE_ID FROM PREF_SALARY WHERE SALARY_ID = " + salary_id;
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
