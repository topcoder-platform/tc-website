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
import	com.topcoder.web.TCES.ejb.SalaryLuObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the SalaryLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public class SalaryLu {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public SalaryLu( Connection conn ) {
		this.conn = conn;
	}

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
		try {
			create( conn, salary_id, salary_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Integer salary_id ) throws SQLException {
		String	delete = "DELETE FROM SALARY_LU WHERE SALARY_ID = " + salary_id;
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

	/**
	 * Set the salary_desc field in the salary_lu table corresponding to the given key.
	 * @param salary_id the table primary key
	 * @param salary_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSalaryDesc( Integer salary_id, String salary_desc ) throws SQLException {
		putRecord( salary_id, salary_desc );
	}

	/**
	 * Get the salary_desc field from the salary_lu table corresponding to the given key.
	 * @param salary_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getSalaryDesc( Integer salary_id ) throws SQLException {
		return( ( (SalaryLuObject) getRecord( salary_id ) ).salary_desc );
	}

	private SalaryLuObject getRecord( Integer salary_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		SalaryLuObject	obj = null;

		obj = new SalaryLuObject();
		String	query = "SELECT salary_id, salary_desc FROM SALARY_LU WHERE SALARY_ID = " + salary_id;
		InputStream	is = null;

		try {
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
		}
		return( obj );
	}

	public int putRecord( Integer salary_id, String salary_desc ) throws SQLException {
		PreparedStatement	ps = null;
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
		}
		return( rc );
	}

	public String list() throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = "SELECT SALARY_ID FROM SALARY_LU";

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Integer( rs.getInt( 1 ) ) );
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
		}
		return( flatten( results ) );
	}

	public Hashtable listContent() throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Hashtable	results = new Hashtable();
		String	query = "SELECT SALARY_ID, salary_desc FROM SALARY_LU";

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.put( new Integer( rs.getInt( 1 ) ), rs.getString( 2 ) );
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
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

}
