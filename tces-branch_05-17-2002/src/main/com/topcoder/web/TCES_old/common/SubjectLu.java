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
import	com.topcoder.web.TCES.ejb.SubjectLuObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the SubjectLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public class SubjectLu {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public SubjectLu( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer subject_id, String subject_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO SUBJECT_LU VALUES (  " + subject_id + ", '" + subject_desc + "' )";

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

	public void create( Integer subject_id, String subject_desc ) throws SQLException {
		try {
			create( conn, subject_id, subject_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Integer subject_id ) throws SQLException {
		String	delete = "DELETE FROM SUBJECT_LU WHERE SUBJECT_ID = " + subject_id;
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

	public SubjectLuObject request( int cmd, SubjectLuObject obj ) throws SQLException {

		switch( cmd ) {

		case SubjectLu.INSERT:
			create( obj.subject_id, obj.subject_desc );
			break;

		case SubjectLu.SELECT:
			obj = getRecord( obj.subject_id );
			break;

		case SubjectLu.UPDATE:
			putRecord( obj.subject_id, obj.subject_desc );
			break;

		case SubjectLu.DELETE:
			delete( obj.subject_id );
			break;

		}
		return( obj );
	}

	/**
	 * Set the subject_desc field in the subject_lu table corresponding to the given key.
	 * @param subject_id the table primary key
	 * @param subject_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSubjectDesc( Integer subject_id, String subject_desc ) throws SQLException {
		putRecord( subject_id, subject_desc );
	}

	/**
	 * Get the subject_desc field from the subject_lu table corresponding to the given key.
	 * @param subject_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getSubjectDesc( Integer subject_id ) throws SQLException {
		return( ( (SubjectLuObject) getRecord( subject_id ) ).subject_desc );
	}

	private SubjectLuObject getRecord( Integer subject_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		SubjectLuObject	obj = null;

		obj = new SubjectLuObject();
		String	query = "SELECT subject_id, subject_desc FROM SUBJECT_LU WHERE SUBJECT_ID = " + subject_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.subject_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.subject_id = null;
			obj.subject_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.subject_desc = null;
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

	public int putRecord( Integer subject_id, String subject_desc ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE SUBJECT_LU SET " );
		if( subject_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SUBJECT_DESC = ?" );
			count++;
		}
		update.append( " WHERE SUBJECT_ID = " + subject_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( subject_desc != null )
				ps.setString( index++, subject_desc );
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
		String	query = "SELECT SUBJECT_ID FROM SUBJECT_LU";

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
		String	query = "SELECT SUBJECT_ID, subject_desc FROM SUBJECT_LU";

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
