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
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the CoderNotify class.
 * @see com.topcoder.web.TCES.ejb.CoderNotify
 * @author Phil Selby, May 22nd, 2002
 */

public class CoderNotifyBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	private static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( java.sql.Connection conn, Long coder_id, Integer notify_id ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO CODER_NOTIFY VALUES (  " + coder_id + ", " + notify_id + " )";

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

	public void create( Long coder_id, Integer notify_id ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, coder_id, notify_id );
		} catch( SQLException e ) {
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
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
		}
	}

	public CoderNotifyObject request( int cmd, CoderNotifyObject obj ) throws SQLException {

		switch( cmd ) {

		case CoderNotify.INSERT:
			create( obj.coder_id, obj.notify_id );
			break;

		case CoderNotify.SELECT:
			obj = getRecord( obj.coder_id );
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
		return( ( (CoderNotifyObject) getRecord( coder_id ) ).notify_id );
	}

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
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.coder_id = new Long( rs.getLong( 1 ) );
			if( rs.wasNull() )
				obj.coder_id = null;
			obj.notify_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.notify_id = null;
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
		String	query = "SELECT CODER_ID FROM CODER_NOTIFY";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Long( rs.getLong( 1 ) ) );
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

	private static final int	GET = 1;
	private static final int	SET = 2;
	private static final int	CLR = 3;

	public boolean getSendNextCompetition( Long coderId )
	  throws SQLException {
		return( op( GET, coderId.longValue(), 1 ) );
	}

	public boolean getSendCompetitionResults( Long coderId )
	  throws SQLException {
		return( op( GET, coderId.longValue(), 2 ) );
	}

	public boolean getSendEmploymentOpportunities( Long coderId )
	  throws SQLException {
		return( op( GET, coderId.longValue(), 3 ) );
	}

	public boolean getSendMemberDevelopmentOpportunities( Long coderId )
	  throws SQLException {
		return( op( GET, coderId.longValue(), 4 ) );
	}

	public boolean getSendTopCoderNews( Long coderId )
	  throws SQLException {
		return( op( GET, coderId.longValue(), 5 ) );
	}

	public void setSendNextCompetition( Long coderId, boolean value )
	  throws SQLException {
		op( ( value ? SET : CLR ), coderId.longValue(), 1 );
	}

	public void setSendCompetitionResults( Long coderId, boolean value )
	  throws SQLException {
		op( ( value ? SET : CLR ), coderId.longValue(), 2 );
	}

	public void setSendEmploymentOpportunities( Long coderId,
	  boolean value ) throws SQLException {
		op( ( value ? SET : CLR ), coderId.longValue(), 3 );
	}

	public void setSendMemberDevelopmentOpportunities( Long coderId,
	  boolean value ) throws SQLException {
		op( ( value ? SET : CLR ), coderId.longValue(), 4 );
	}

	public void setSendTopCoderNews( Long coderId, boolean value )
	  throws SQLException {
		op( ( value ? SET : CLR ), coderId.longValue(), 5 );
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
			if( rs != null ) try { rs.close(); } catch( Exception e ) {};
			if( stmt != null ) try { stmt.close(); } catch( Exception e ) {};
			if( conn != null ) try { conn.close(); } catch( Exception e ) {};
		}
		return( found );
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
