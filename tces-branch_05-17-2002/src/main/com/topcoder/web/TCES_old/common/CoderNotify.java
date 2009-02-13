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
import	com.topcoder.web.TCES.ejb.CoderNotifyObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the CoderNotify class.
 * @author Phil Selby, May 22nd, 2002
 */

public class CoderNotify {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public CoderNotify( Connection conn ) {
		this.conn = conn;
	}

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
		try {
			create( conn, coder_id, notify_id );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Long coder_id ) throws SQLException {
		String	delete = "DELETE FROM CODER_NOTIFY WHERE CODER_ID = " + coder_id;
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

	/**
	 * Set the notify_id field in the coder_notify table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param notify_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setNotifyId( Long coder_id, Integer notify_id ) throws SQLException {
		putRecord( coder_id, notify_id );
	}

	/**
	 * Get the notify_id field from the coder_notify table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getNotifyId( Long coder_id ) throws SQLException {
		return( ( (CoderNotifyObject) getRecord( coder_id ) ).notify_id );
	}

	private CoderNotifyObject getRecord( Long coder_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		CoderNotifyObject	obj = null;

		obj = new CoderNotifyObject();
		String	query = "SELECT coder_id, notify_id FROM CODER_NOTIFY WHERE CODER_ID = " + coder_id;
		InputStream	is = null;

		try {
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
		}
		return( obj );
	}

	public int putRecord( Long coder_id, Integer notify_id ) throws SQLException {
		PreparedStatement	ps = null;
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

	public String list() throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = "SELECT CODER_ID FROM CODER_NOTIFY";

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Long( rs.getLong( 1 ) ) );
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
		}
		return( found );
	}
}
