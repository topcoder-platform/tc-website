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
import	com.topcoder.web.TCES.ejb.Editor;
import	com.topcoder.web.TCES.ejb.EditorObject;
import	com.topcoder.web.TCES.common.*;
import	com.topcoder.web.TCES.common.Lookup;

/**
 * This is the implementation of the Editor class.
 * @see com.topcoder.web.TCES.ejb.Editor
 * @author Phil Selby, May 22nd, 2002
 */

public class EditorBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
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
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, editor_id, editor_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Integer editor_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM EDITOR WHERE EDITOR_ID = " + editor_id;
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

	public void setEditorDesc( Integer editor_id, String editor_desc ) throws SQLException {
		putRecord( editor_id, editor_desc );
	}

	public String getEditorDesc( Integer editor_id ) throws SQLException {
		return( ( (EditorObject) getRecord( editor_id ) ).editor_desc );
	}

	private EditorObject getRecord( Integer editor_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		EditorObject	obj = null;

		obj = new EditorObject();
		String	query = "SELECT editor_id, editor_desc FROM EDITOR WHERE EDITOR_ID = " + editor_id;
		InputStream	is = null;

		try {
			conn = getConnection();
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
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
		}
		return( obj );
	}

	public int putRecord( Integer editor_id, String editor_desc ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
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
			conn = getConnection();
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
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
		}
		return( rc );
	}

	public String list() throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = "SELECT EDITOR_ID FROM EDITOR";

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
		String	query = "SELECT EDITOR_ID, editor_desc FROM EDITOR";

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

	public Lookup listEditorIdEditorDesc() throws SQLException {
		Connection	conn = null;
		Statement	stmt = null;
		ResultSet	rs = null;
		String		query = "SELECT EDITOR_ID, EDITOR_DESC FROM EDITOR";
		Lookup		result = new Lookup();
		Integer		I = null;

		try {
			conn = getConnection();
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
			if( conn != null ) try { conn.close(); } catch( Exception e ) {};
		}
		return( result );
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
