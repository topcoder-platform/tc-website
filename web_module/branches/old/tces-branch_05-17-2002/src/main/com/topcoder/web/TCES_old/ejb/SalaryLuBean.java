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
import	com.topcoder.web.TCES.ejb.SalaryLu;
import	com.topcoder.web.TCES.ejb.SalaryLuObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the SalaryLu class.
 * @see com.topcoder.web.TCES.ejb.SalaryLu
 * @author Phil Selby, May 22nd, 2002
 */

public class SalaryLuBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	private static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer salary_id, String salary_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO SALARY_LU VALUES (  " + salary_id + ", '" + salary_desc + "' )";

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

	public void create( Integer salary_id, String salary_desc ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, salary_id, salary_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Integer salary_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM SALARY_LU WHERE SALARY_ID = " + salary_id;
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

	public SalaryLuObject request( int cmd, SalaryLuObject obj ) throws SQLException {

		switch( cmd ) {

		case SalaryLu.INSERT:
			create( obj.salary_id, obj.salary_desc );
			break;

		case SalaryLu.SELECT:
			obj = getRecord( obj.salary_id );
			break;

		case SalaryLu.UPDATE:
			putRecord( obj.salary_id, obj.salary_desc );
			break;

		case SalaryLu.DELETE:
			delete( obj.salary_id );
			break;

		}
		return( obj );
	}

	public void setSalaryDesc( Integer salary_id, String salary_desc ) throws SQLException {
		putRecord( salary_id, salary_desc );
	}

	public String getSalaryDesc( Integer salary_id ) throws SQLException {
		return( ( (SalaryLuObject) getRecord( salary_id ) ).salary_desc );
	}

	private SalaryLuObject getRecord( Integer salary_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		SalaryLuObject	obj = null;

		obj = new SalaryLuObject();
		String	query = "SELECT salary_id, salary_desc FROM SALARY_LU WHERE SALARY_ID = " + salary_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.salary_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.salary_id = null;
			obj.salary_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.salary_desc = null;
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

	public int putRecord( Integer salary_id, String salary_desc ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE SALARY_LU SET " );
		if( salary_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SALARY_DESC = ?" );
			count++;
		}
		update.append( " WHERE SALARY_ID = " + salary_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( salary_desc != null )
				ps.setString( index++, salary_desc );
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
		String	query = "SELECT SALARY_ID FROM SALARY_LU";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Integer( rs.getInt( 1 ) ) );
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
		}
		return( flatten( results ) );
	}

	public Hashtable listContent() throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Hashtable	results = new Hashtable();
		String	query = "SELECT SALARY_ID, salary_desc FROM SALARY_LU";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.put( new Integer( rs.getInt( 1 ) ), rs.getString( 2 ) );
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
		}
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
