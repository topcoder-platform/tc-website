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
import	com.topcoder.web.TCES.ejb.ExpTechnology;
import	com.topcoder.web.TCES.ejb.ExpTechnologyObject;

public class ExpTechnologyBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public String getKey( Integer experience_id ) {
		String	key = "";

		key += fmt0.format( experience_id );
		return( key );
	}

	public String getKey( ExpTechnologyObject obj ) {
		return( getKey( obj.experience_id ) );
	}

	public void create( Integer experience_id, Integer technology_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO EXP_TECHNOLOGY VALUES (  " + experience_id + ", " + technology_id + " )";

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

	public void delete( Integer experience_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM EXP_TECHNOLOGY WHERE EXPERIENCE_ID = " + experience_id;
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

	public ExpTechnologyObject request( int cmd, ExpTechnologyObject obj ) throws SQLException {

		switch( cmd ) {

		case ExpTechnology.INSERT:
			create( obj.experience_id, obj.technology_id );
			break;

		case ExpTechnology.SELECT:
			obj = getRecord( obj.experience_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case ExpTechnology.UPDATE:
			putRecord( obj.experience_id, obj.technology_id );
			break;

		case ExpTechnology.DELETE:
			delete( obj.experience_id );
			break;

		}
		return( obj );
	}

	public void setTechnologyId( Integer experience_id, Integer technology_id ) throws SQLException {
		putRecord( experience_id, technology_id );
	}

	public Integer getTechnologyId( Integer experience_id ) throws SQLException {
		ExpTechnologyObject	obj = null;
		Integer	result;

		obj = getRecord( experience_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.technology_id );
	}

	private class RecordNotFoundException extends Exception {}

	private ExpTechnologyObject getRecord( Integer experience_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		String	key = getKey( experience_id );
		ExpTechnologyObject	obj = null;

		obj = new ExpTechnologyObject();
		String	query = "SELECT experience_id, technology_id FROM EXP_TECHNOLOGY WHERE EXPERIENCE_ID = " + experience_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.experience_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.experience_id = null;
			obj.technology_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.technology_id = null;
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

	public int putRecord(Integer experience_id, Integer technology_id ) throws SQLException {
		String	identifier = getKey( experience_id );
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE EXP_TECHNOLOGY SET " );
		if( technology_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "TECHNOLOGY_ID = " + technology_id.intValue() );
			count++;
		}
		update.append( " WHERE EXPERIENCE_ID = " + experience_id );
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
		String	query = "SELECT EXPERIENCE_ID FROM EXP_TECHNOLOGY";

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
