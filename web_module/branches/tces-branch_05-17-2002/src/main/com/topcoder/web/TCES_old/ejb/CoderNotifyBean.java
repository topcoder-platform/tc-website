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
import	com.topcoder.web.TCES.ejb.CoderNotify;
import	com.topcoder.web.TCES.ejb.CoderNotifyObject;

/**
 * This is the implementation of the CoderNotify class.
 * @see com.topcoder.web.TCES.ejb.CoderNotify
 * @author Phil Selby, May 22nd, 2002
 */

public class CoderNotifyBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( java.sql.Connection conn, Long coder_id, Integer notify_id ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO CODER_NOTIFY VALUES (  " + coder_id + ", " + notify_id + " )";

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

	public void create( Long coder_id, Integer notify_id ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, coder_id, notify_id );
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

	public void delete( Long coder_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM CODER_NOTIFY WHERE CODER_ID = " + coder_id;
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

	public CoderNotifyObject request( int cmd, CoderNotifyObject obj ) throws SQLException {

		switch( cmd ) {

		case CoderNotify.INSERT:
			create( obj.coder_id, obj.notify_id );
			break;

		case CoderNotify.SELECT:
			obj = getRecord( obj.coder_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case CoderNotify.UPDATE:
			putRecord( obj.coder_id, obj.notify_id );
			break;

		case CoderNotify.DELETE:
			delete( obj.coder_id );
			break;

		}
		return( obj );
	}

	public void setNotifyId( Long coder_id, Integer notify_id ) throws SQLException {
		putRecord( coder_id, notify_id );
	}

	public Integer getNotifyId( Long coder_id ) throws SQLException {
		CoderNotifyObject	obj = null;
		Integer	result;

		obj = getRecord( coder_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.notify_id );
	}

	private class RecordNotFoundException extends Exception {}

	private CoderNotifyObject getRecord( Long coder_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		CoderNotifyObject	obj = null;

		obj = new CoderNotifyObject();
		String	query = "SELECT coder_id, notify_id FROM CODER_NOTIFY WHERE CODER_ID = " + coder_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.coder_id = new Long( rs.getLong( 1 ) );
			if( rs.wasNull() )
				obj.coder_id = null;
			obj.notify_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.notify_id = null;
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

	public int putRecord( Long coder_id, Integer notify_id ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE CODER_NOTIFY SET " );
		if( notify_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "NOTIFY_ID = " + notify_id.intValue() );
			count++;
		}
		update.append( " WHERE CODER_ID = " + coder_id );
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
		String	query = "SELECT CODER_ID FROM CODER_NOTIFY";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Long( rs.getLong( 1 ) ) );
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

	private static final int	GET = 1;
	private static final int	SET = 2;
	private static final int	CLR = 3;

	public boolean getSendNextCompetition( long coder_id )
	  throws SQLException {
		return( op( GET, coder_id, 1 ) );
	}

	public boolean getSendCompetitionResults( long coder_id )
	  throws SQLException {
		return( op( GET, coder_id, 2 ) );
	}

	public boolean getSendEmploymentOpportunities( long coder_id )
	  throws SQLException {
		return( op( GET, coder_id, 3 ) );
	}

	public boolean getSendMemberDevelopmentOpportunities( long coder_id )
	  throws SQLException {
		return( op( GET, coder_id, 4 ) );
	}

	public boolean getSendTopCoderNews( long coder_id )
	  throws SQLException {
		return( op( GET, coder_id, 5 ) );
	}

	public void setSendNextCompetition( long coder_id, boolean value )
	  throws SQLException {
		op( ( value ? SET : CLR ), coder_id, 1 );
	}

	public void setSendCompetitionResults( long coder_id, boolean value )
	  throws SQLException {
		op( ( value ? SET : CLR ), coder_id, 2 );
	}

	public void setSendEmploymentOpportunities( long coder_id,
	  boolean value ) throws SQLException {
		op( ( value ? SET : CLR ), coder_id, 3 );
	}

	public void setSendMemberDevelopmentOpportunities( long coder_id,
	  boolean value ) throws SQLException {
		op( ( value ? SET : CLR ), coder_id, 4 );
	}

	public void setSendTopCoderNews( long coder_id, boolean value )
	  throws SQLException {
		op( ( value ? SET : CLR ), coder_id, 5 );
	}

	/**
	 * Perform a notify operation.
	 * This is the meat of the class. All other methods simply
	 * pass appropriate arguments for the desired function.
	 * @param cmd one of GET, SET or CLR
	 * @param coder_id coder_id
	 * @param notify value to check
	 * @return boolean true if a record was found, false if not
	 * @author Phil Selby, June 13th, 2002
	 */

	private boolean op( int cmd, long coder_id, int notify )
	  throws SQLException {
		Connection	conn = null;
		Statement	stmt = null;
		ResultSet	rs = null;
		boolean		found = false;
		String		query = "SELECT COUNT(*) FROM CODER_NOTIFY " +
		  "WHERE CODER_ID = " + coder_id + " AND NOTIFY_ID = " +
		  notify;
		String		delete = "DELETE FROM CODER_NOTIFY " +
		  "WHERE CODER_ID = " + coder_id + " AND NOTIFY_ID = " +
		  notify;
		String		insert = "INSERT INTO CODER_NOTIFY " +
		  "VALUES ( " + coder_id + ", " + notify + " )";

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery( query );
			if( ! rs.next() ) {
				// we have a problem since we should always
				// have a count of 0 or 1
				throw new SQLException( "no count returned" );
			}
			if( rs.getInt( 1 ) > 0 )
				found = true;
			if( ( cmd == CLR ) && found )
				stmt.executeUpdate( delete );
			if( ( cmd == SET )&& ! found )
				stmt.executeUpdate( insert );
		}
		catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( rs != null )
				try { rs.close(); } catch( Exception e ) {};
			if( stmt != null )
				try { stmt.close(); } catch( Exception e ) {};
			if( conn != null )
				try { conn.close(); } catch( Exception e ) {};
		}
		return( found );
	}

	private Connection getConnection() throws SQLException {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)
			  context.lookup( "OLTP" );
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
