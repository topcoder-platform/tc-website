package	com.topcoder.web.TCES.common;

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
import	com.topcoder.web.TCES.ejb.PreferenceJobRoleXrefObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the PreferenceJobRoleXref class.
 * @author Phil Selby, May 22nd, 2002
 */

public class PreferenceJobRoleXref {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public PreferenceJobRoleXref( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );
	private static final DecimalFormat	fmt1 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Long profile_id, Integer job_role_id ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PREFERENCE_JOB_ROLE_XREF VALUES (  " + profile_id + ", " + job_role_id + " )";

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

	public void create( Long profile_id, Integer job_role_id ) throws SQLException {
		try {
			create( conn, profile_id, job_role_id );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Long profile_id, Integer job_role_id ) throws SQLException {
		String	delete = "DELETE FROM PREFERENCE_JOB_ROLE_XREF WHERE PROFILE_ID = " + profile_id + " AND JOB_ROLE_ID = " + job_role_id;
		PreparedStatement	ps = null;

		try {
			ps = conn.prepareStatement( delete );
			ps.executeUpdate();
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
		}
	}

	public PreferenceJobRoleXrefObject request( int cmd, PreferenceJobRoleXrefObject obj ) throws SQLException {

		switch( cmd ) {

		case PreferenceJobRoleXref.INSERT:
			create( obj.profile_id, obj.job_role_id );
			break;

		case PreferenceJobRoleXref.SELECT:
			obj = getRecord( obj.profile_id, obj.job_role_id );
			break;

		case PreferenceJobRoleXref.UPDATE:
			putRecord( obj.profile_id, obj.job_role_id );
			break;

		case PreferenceJobRoleXref.DELETE:
			delete( obj.profile_id, obj.job_role_id );
			break;

		}
		return( obj );
	}

	private PreferenceJobRoleXrefObject getRecord( Long profile_id, Integer job_role_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		PreferenceJobRoleXrefObject	obj = null;

		obj = new PreferenceJobRoleXrefObject();
		String	query = "SELECT profile_id, job_role_id FROM PREFERENCE_JOB_ROLE_XREF WHERE PROFILE_ID = " + profile_id + " AND JOB_ROLE_ID = " + job_role_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.profile_id = new Long( rs.getLong( 1 ) );
			if( rs.wasNull() )
				obj.profile_id = null;
			obj.job_role_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.job_role_id = null;
			rs.close();
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( rs != null ) try { rs.close(); } catch( Exception f ) {}
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
		}
		return( obj );
	}

	public int putRecord( Long profile_id, Integer job_role_id ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PREFERENCE_JOB_ROLE_XREF SET " );
		update.append( " WHERE PROFILE_ID = " + profile_id + " AND JOB_ROLE_ID = " + job_role_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			rc = ps.executeUpdate();
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
		}
		return( rc );
	}

	public Hashtable list() throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Hashtable	results = new Hashtable();
		String	query = "SELECT PROFILE_ID, JOB_ROLE_ID FROM PREFERENCE_JOB_ROLE_XREF";

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.put( new Long( rs.getLong( 1 ) ), new Integer( rs.getInt( 2 ) ) );
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
		}
		return( results );
	}

	public String findByJobRoleId( Integer job_role_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = null;

		try {
			query = "SELECT PROFILE_ID FROM PREFERENCE_JOB_ROLE_XREF WHERE JOB_ROLE_ID = " + job_role_id;
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

}
