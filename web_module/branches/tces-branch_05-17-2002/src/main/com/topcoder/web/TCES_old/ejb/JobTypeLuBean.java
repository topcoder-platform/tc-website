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
import	com.topcoder.web.TCES.ejb.JobTypeLu;
import	com.topcoder.web.TCES.ejb.JobTypeLuObject;

/**
 * This is the implementation of the JobTypeLu class.
 * @see com.topcoder.web.TCES.ejb.JobTypeLu
 * @author Phil Selby, May 22nd, 2002
 */

public class JobTypeLuBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer job_type_id, String job_type_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO JOB_TYPE_LU VALUES (  " + job_type_id + ", '" + job_type_desc + "' )";

		try {
			ps = conn.prepareStatement( insert );
			ps.executeUpdate();
		} catch( SQLException e ) {
			if( ps != null )
				try { ps.close(); } catch( Exception f ) {};
			ps = null;
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( ps != null )
				try { ps.close(); } catch( Exception f ) {};
		}
	}

	public void create( Integer job_type_id, String job_type_desc ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, job_type_id, job_type_desc );
		} catch( SQLException e ) {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {}
			conn = null;
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Integer job_type_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM JOB_TYPE_LU WHERE JOB_TYPE_ID = " + job_type_id;
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

	public JobTypeLuObject request( int cmd, JobTypeLuObject obj ) throws SQLException {

		switch( cmd ) {

		case JobTypeLu.INSERT:
			create( obj.job_type_id, obj.job_type_desc );
			break;

		case JobTypeLu.SELECT:
			obj = getRecord( obj.job_type_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case JobTypeLu.UPDATE:
			putRecord( obj.job_type_id, obj.job_type_desc );
			break;

		case JobTypeLu.DELETE:
			delete( obj.job_type_id );
			break;

		}
		return( obj );
	}

	public void setJobTypeDesc( Integer job_type_id, String job_type_desc ) throws SQLException {
		putRecord( job_type_id, job_type_desc );
	}

	public String getJobTypeDesc( Integer job_type_id ) throws SQLException {
		JobTypeLuObject	obj = null;
		String	result;

		obj = getRecord( job_type_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.job_type_desc );
	}

	private class RecordNotFoundException extends Exception {}

	private JobTypeLuObject getRecord( Integer job_type_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		JobTypeLuObject	obj = null;

		obj = new JobTypeLuObject();
		String	query = "SELECT job_type_id, job_type_desc FROM JOB_TYPE_LU WHERE JOB_TYPE_ID = " + job_type_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.job_type_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.job_type_id = null;
			obj.job_type_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.job_type_desc = null;
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

	public int putRecord( Integer job_type_id, String job_type_desc ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE JOB_TYPE_LU SET " );
		if( job_type_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "JOB_TYPE_DESC = '" + job_type_desc + "'" );
			count++;
		}
		update.append( " WHERE JOB_TYPE_ID = " + job_type_id );
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
		String	query = "SELECT JOB_TYPE_ID FROM JOB_TYPE_LU";

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

	public Hashtable listContent() throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Hashtable	results = new Hashtable();
		String	query = "SELECT JOB_TYPE_ID, job_type_desc FROM JOB_TYPE_LU";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.put( new Integer( rs.getInt( 1 ) ), rs.getString( 2 ) );
		} catch( SQLException e ) {
			try { if( ps != null ) ps.close(); } catch( Exception f ) {}
			try { if( conn != null ) conn.close(); } catch( Exception f ) {}
			throw( e );
		}
		try { if( ps != null ) ps.close(); } catch( Exception f ) {}
		try { if( conn != null ) conn.close(); } catch( Exception f ) {}
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
			DataSource ds = (DataSource)
			  context.lookup( "jdbc/TCES" );
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
