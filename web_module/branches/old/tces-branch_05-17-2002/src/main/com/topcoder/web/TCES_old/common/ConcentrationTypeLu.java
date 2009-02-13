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
import	com.topcoder.web.TCES.ejb.ConcentrationTypeLuObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the ConcentrationTypeLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public class ConcentrationTypeLu {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public ConcentrationTypeLu( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer concentration_type_id, String concentration_type_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO CONCENTRATION_TYPE_LU VALUES (  " + concentration_type_id + ", '" + concentration_type_desc + "' )";

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

	public void create( Integer concentration_type_id, String concentration_type_desc ) throws SQLException {
		try {
			create( conn, concentration_type_id, concentration_type_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Integer concentration_type_id ) throws SQLException {
		String	delete = "DELETE FROM CONCENTRATION_TYPE_LU WHERE CONCENTRATION_TYPE_ID = " + concentration_type_id;
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

	public ConcentrationTypeLuObject request( int cmd, ConcentrationTypeLuObject obj ) throws SQLException {

		switch( cmd ) {

		case ConcentrationTypeLu.INSERT:
			create( obj.concentration_type_id, obj.concentration_type_desc );
			break;

		case ConcentrationTypeLu.SELECT:
			obj = getRecord( obj.concentration_type_id );
			break;

		case ConcentrationTypeLu.UPDATE:
			putRecord( obj.concentration_type_id, obj.concentration_type_desc );
			break;

		case ConcentrationTypeLu.DELETE:
			delete( obj.concentration_type_id );
			break;

		}
		return( obj );
	}

	/**
	 * Set the concentration_type_desc field in the concentration_type_lu table corresponding to the given key.
	 * @param concentration_type_id the table primary key
	 * @param concentration_type_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setConcentrationTypeDesc( Integer concentration_type_id, String concentration_type_desc ) throws SQLException {
		putRecord( concentration_type_id, concentration_type_desc );
	}

	/**
	 * Get the concentration_type_desc field from the concentration_type_lu table corresponding to the given key.
	 * @param concentration_type_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getConcentrationTypeDesc( Integer concentration_type_id ) throws SQLException {
		return( ( (ConcentrationTypeLuObject) getRecord( concentration_type_id ) ).concentration_type_desc );
	}

	private ConcentrationTypeLuObject getRecord( Integer concentration_type_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		ConcentrationTypeLuObject	obj = null;

		obj = new ConcentrationTypeLuObject();
		String	query = "SELECT concentration_type_id, concentration_type_desc FROM CONCENTRATION_TYPE_LU WHERE CONCENTRATION_TYPE_ID = " + concentration_type_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.concentration_type_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.concentration_type_id = null;
			obj.concentration_type_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.concentration_type_desc = null;
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

	public int putRecord( Integer concentration_type_id, String concentration_type_desc ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE CONCENTRATION_TYPE_LU SET " );
		if( concentration_type_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "CONCENTRATION_TYPE_DESC = ?" );
			count++;
		}
		update.append( " WHERE CONCENTRATION_TYPE_ID = " + concentration_type_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( concentration_type_desc != null )
				ps.setString( index++, concentration_type_desc );
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
		String	query = "SELECT CONCENTRATION_TYPE_ID FROM CONCENTRATION_TYPE_LU";

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
		String	query = "SELECT CONCENTRATION_TYPE_ID, concentration_type_desc FROM CONCENTRATION_TYPE_LU";

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
