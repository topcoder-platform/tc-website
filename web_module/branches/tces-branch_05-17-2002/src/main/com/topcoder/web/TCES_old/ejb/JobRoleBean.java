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
import	com.topcoder.web.TCES.ejb.JobRole;
import	com.topcoder.web.TCES.ejb.JobRoleObject;

public class JobRoleBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public String getKey( Integer job_role_id ) {
		String	key = "";

		key += fmt0.format( job_role_id );
		return( key );
	}

	public String getKey( JobRoleObject obj ) {
		return( getKey( obj.job_role_id ) );
	}

	public void create( Integer job_role_id, String description ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO JOB_ROLE VALUES (  " + job_role_id + ", '" + description + "' )";

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

	public void delete( Integer job_role_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM JOB_ROLE WHERE JOB_ROLE_ID = " + job_role_id;
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

	public JobRoleObject request( int cmd, JobRoleObject obj ) throws SQLException {

		switch( cmd ) {

		case JobRole.INSERT:
			create( obj.job_role_id, obj.description );
			break;

		case JobRole.SELECT:
			obj = getRecord( obj.job_role_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case JobRole.UPDATE:
			putRecord( obj.job_role_id, obj.description );
			break;

		case JobRole.DELETE:
			delete( obj.job_role_id );
			break;

		}
		return( obj );
	}

	public void setDescription( Integer job_role_id, String description ) throws SQLException {
		putRecord( job_role_id, description );
	}

	public String getDescription( Integer job_role_id ) throws SQLException {
		JobRoleObject	obj = null;
		String	result;

		obj = getRecord( job_role_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.description );
	}

	private class RecordNotFoundException extends Exception {}

	private JobRoleObject getRecord( Integer job_role_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		String	key = getKey( job_role_id );
		JobRoleObject	obj = null;

		obj = new JobRoleObject();
		String	query = "SELECT job_role_id, description FROM JOB_ROLE WHERE JOB_ROLE_ID = " + job_role_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.job_role_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.job_role_id = null;
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

	public int putRecord(Integer job_role_id, String description ) throws SQLException {
		String	identifier = getKey( job_role_id );
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE JOB_ROLE SET " );
		if( description != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "DESCRIPTION = '" + description + "'" );
			count++;
		}
		update.append( " WHERE JOB_ROLE_ID = " + job_role_id );
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
		String	query = "SELECT JOB_ROLE_ID FROM JOB_ROLE";

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
