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
import	com.topcoder.web.TCES.ejb.IndustryLuObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the IndustryLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public class IndustryLu {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public IndustryLu( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer industry_id, String industry_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO INDUSTRY_LU VALUES (  " + industry_id + ", '" + industry_desc + "' )";

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

	public void create( Integer industry_id, String industry_desc ) throws SQLException {
		try {
			create( conn, industry_id, industry_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Integer industry_id ) throws SQLException {
		String	delete = "DELETE FROM INDUSTRY_LU WHERE INDUSTRY_ID = " + industry_id;
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

	public IndustryLuObject request( int cmd, IndustryLuObject obj ) throws SQLException {

		switch( cmd ) {

		case IndustryLu.INSERT:
			create( obj.industry_id, obj.industry_desc );
			break;

		case IndustryLu.SELECT:
			obj = getRecord( obj.industry_id );
			break;

		case IndustryLu.UPDATE:
			putRecord( obj.industry_id, obj.industry_desc );
			break;

		case IndustryLu.DELETE:
			delete( obj.industry_id );
			break;

		}
		return( obj );
	}

	/**
	 * Set the industry_desc field in the industry_lu table corresponding to the given key.
	 * @param industry_id the table primary key
	 * @param industry_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setIndustryDesc( Integer industry_id, String industry_desc ) throws SQLException {
		putRecord( industry_id, industry_desc );
	}

	/**
	 * Get the industry_desc field from the industry_lu table corresponding to the given key.
	 * @param industry_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getIndustryDesc( Integer industry_id ) throws SQLException {
		return( ( (IndustryLuObject) getRecord( industry_id ) ).industry_desc );
	}

	private IndustryLuObject getRecord( Integer industry_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		IndustryLuObject	obj = null;

		obj = new IndustryLuObject();
		String	query = "SELECT industry_id, industry_desc FROM INDUSTRY_LU WHERE INDUSTRY_ID = " + industry_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.industry_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.industry_id = null;
			obj.industry_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.industry_desc = null;
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

	public int putRecord( Integer industry_id, String industry_desc ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE INDUSTRY_LU SET " );
		if( industry_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "INDUSTRY_DESC = ?" );
			count++;
		}
		update.append( " WHERE INDUSTRY_ID = " + industry_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( industry_desc != null )
				ps.setString( index++, industry_desc );
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
		String	query = "SELECT INDUSTRY_ID FROM INDUSTRY_LU";

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
		String	query = "SELECT INDUSTRY_ID, industry_desc FROM INDUSTRY_LU";

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
