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
import	com.topcoder.web.TCES.ejb.GpaTypeObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the GpaType class.
 * @author Phil Selby, May 22nd, 2002
 */

public class GpaType {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public GpaType( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer gpa_type_id, String gpa_type_desc, Integer gpa_type_value ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO GPA_TYPE VALUES (  " + gpa_type_id + ", '" + gpa_type_desc + "', " + gpa_type_value + " )";

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

	public void create( Integer gpa_type_id, String gpa_type_desc, Integer gpa_type_value ) throws SQLException {
		try {
			create( conn, gpa_type_id, gpa_type_desc, gpa_type_value );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Integer gpa_type_id ) throws SQLException {
		String	delete = "DELETE FROM GPA_TYPE WHERE GPA_TYPE_ID = " + gpa_type_id;
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

	public GpaTypeObject request( int cmd, GpaTypeObject obj ) throws SQLException {

		switch( cmd ) {

		case GpaType.INSERT:
			create( obj.gpa_type_id, obj.gpa_type_desc, obj.gpa_type_value );
			break;

		case GpaType.SELECT:
			obj = getRecord( obj.gpa_type_id );
			break;

		case GpaType.UPDATE:
			putRecord( obj.gpa_type_id, obj.gpa_type_desc, obj.gpa_type_value );
			break;

		case GpaType.DELETE:
			delete( obj.gpa_type_id );
			break;

		}
		return( obj );
	}

	/**
	 * Set the gpa_type_desc field in the gpa_type table corresponding to the given key.
	 * @param gpa_type_id the table primary key
	 * @param gpa_type_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setGpaTypeDesc( Integer gpa_type_id, String gpa_type_desc ) throws SQLException {
		putRecord( gpa_type_id, gpa_type_desc, null );
	}

	/**
	 * Get the gpa_type_desc field from the gpa_type table corresponding to the given key.
	 * @param gpa_type_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getGpaTypeDesc( Integer gpa_type_id ) throws SQLException {
		return( ( (GpaTypeObject) getRecord( gpa_type_id ) ).gpa_type_desc );
	}

	/**
	 * Set the gpa_type_value field in the gpa_type table corresponding to the given key.
	 * @param gpa_type_id the table primary key
	 * @param gpa_type_value the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setGpaTypeValue( Integer gpa_type_id, Integer gpa_type_value ) throws SQLException {
		putRecord( gpa_type_id, null, gpa_type_value );
	}

	/**
	 * Get the gpa_type_value field from the gpa_type table corresponding to the given key.
	 * @param gpa_type_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getGpaTypeValue( Integer gpa_type_id ) throws SQLException {
		return( ( (GpaTypeObject) getRecord( gpa_type_id ) ).gpa_type_value );
	}

	private GpaTypeObject getRecord( Integer gpa_type_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		GpaTypeObject	obj = null;

		obj = new GpaTypeObject();
		String	query = "SELECT gpa_type_id, gpa_type_desc, gpa_type_value FROM GPA_TYPE WHERE GPA_TYPE_ID = " + gpa_type_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.gpa_type_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.gpa_type_id = null;
			obj.gpa_type_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.gpa_type_desc = null;
			obj.gpa_type_value = new Integer( rs.getInt( 3 ) );
			if( rs.wasNull() )
				obj.gpa_type_value = null;
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

	public int putRecord( Integer gpa_type_id, String gpa_type_desc, Integer gpa_type_value ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE GPA_TYPE SET " );
		if( gpa_type_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "GPA_TYPE_DESC = ?" );
			count++;
		}
		if( gpa_type_value != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "GPA_TYPE_VALUE = " + gpa_type_value.intValue() );
			count++;
		}
		update.append( " WHERE GPA_TYPE_ID = " + gpa_type_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( gpa_type_desc != null )
				ps.setString( index++, gpa_type_desc );
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
		String	query = "SELECT GPA_TYPE_ID FROM GPA_TYPE";

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
