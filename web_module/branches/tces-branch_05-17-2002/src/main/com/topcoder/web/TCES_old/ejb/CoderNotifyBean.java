package	com.topcoder.web.TCES.ejb;

import	java.sql.Connection;
import	java.sql.PreparedStatement;
import	java.sql.Statement;
import	java.sql.SQLException;
import	java.sql.ResultSet;
import	java.rmi.RemoteException;
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

/**
 * This is the implementation of the CoderNotify class.
 * @see com.topcoder.web.TCES.ejb.CoderNotify
 * @author Phil Selby, June 12th, 2002
 */

public class CoderNotifyBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
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
