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
import	com.topcoder.web.TCES.ejb.EditorObject;
import	com.topcoder.web.TCES.common.*;
import	com.topcoder.web.TCES.common.Lookup;

/**
 * This is the implementation of the Editor class.
 * @author Phil Selby, May 22nd, 2002
 */

public class Editor {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public Editor( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "0" );

	public void create( java.sql.Connection conn, Integer editor_id, String editor_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO EDITOR VALUES (  " + editor_id + ", '" + editor_desc + "' )";

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

	public void create( Integer editor_id, String editor_desc ) throws SQLException {
		try {
			create( conn, editor_id, editor_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Integer editor_id ) throws SQLException {
		String	delete = "DELETE FROM EDITOR WHERE EDITOR_ID = " + editor_id;
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

	public EditorObject request( int cmd, EditorObject obj ) throws SQLException {

		switch( cmd ) {

		case Editor.INSERT:
			create( obj.editor_id, obj.editor_desc );
			break;

		case Editor.SELECT:
			obj = getRecord( obj.editor_id );
			break;

		case Editor.UPDATE:
			putRecord( obj.editor_id, obj.editor_desc );
			break;

		case Editor.DELETE:
			delete( obj.editor_id );
			break;

		}
		return( obj );
	}

	/**
	 * Set the editor_desc field in the editor table corresponding to the given key.
	 * @param editor_id the table primary key
	 * @param editor_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setEditorDesc( Integer editor_id, String editor_desc ) throws SQLException {
		putRecord( editor_id, editor_desc );
	}

	/**
	 * Get the editor_desc field from the editor table corresponding to the given key.
	 * @param editor_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getEditorDesc( Integer editor_id ) throws SQLException {
		return( ( (EditorObject) getRecord( editor_id ) ).editor_desc );
	}

	private EditorObject getRecord( Integer editor_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		EditorObject	obj = null;

		obj = new EditorObject();
		String	query = "SELECT editor_id, editor_desc FROM EDITOR WHERE EDITOR_ID = " + editor_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.editor_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.editor_id = null;
			obj.editor_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.editor_desc = null;
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

	public int putRecord( Integer editor_id, String editor_desc ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE EDITOR SET " );
		if( editor_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "EDITOR_DESC = ?" );
			count++;
		}
		update.append( " WHERE EDITOR_ID = " + editor_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( editor_desc != null )
				ps.setString( index++, editor_desc );
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
		String	query = "SELECT EDITOR_ID FROM EDITOR";

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
		String	query = "SELECT EDITOR_ID, editor_desc FROM EDITOR";

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

	public Lookup listEditorIdEditorDesc() throws SQLException {
		Statement	stmt = null;
		ResultSet	rs = null;
		String		query = "SELECT EDITOR_ID, EDITOR_DESC FROM EDITOR";
		Lookup		result = new Lookup();
		Integer		I = null;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery( query );
			while( rs.next() ) {
				I = new Integer( rs.getInt( 1 ) );
				result.addPair( I.toString(),
				  rs.getString( 2 ) );
			}
		}
		catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( rs != null ) try { rs.close(); } catch( Exception e ) {};
			if( stmt != null ) try { stmt.close(); } catch( Exception e ) {};
		}
		return( result );
	}
}
