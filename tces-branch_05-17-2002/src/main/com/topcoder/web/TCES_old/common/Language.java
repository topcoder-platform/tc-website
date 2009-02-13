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
import	com.topcoder.web.TCES.ejb.LanguageObject;
import	com.topcoder.web.TCES.common.*;
import	com.topcoder.web.TCES.common.Lookup;

/**
 * This is the implementation of the Language class.
 * @author Phil Selby, May 22nd, 2002
 */

public class Language {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public Language( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer language_id, String language_name, String status, String language_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO LANGUAGE VALUES (  " + language_id + ", '" + language_name + "', '" + status + "', '" + language_desc + "' )";

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

	public void create( Integer language_id, String language_name, String status, String language_desc ) throws SQLException {
		try {
			create( conn, language_id, language_name, status, language_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Integer language_id ) throws SQLException {
		String	delete = "DELETE FROM LANGUAGE WHERE LANGUAGE_ID = " + language_id;
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

	public LanguageObject request( int cmd, LanguageObject obj ) throws SQLException {

		switch( cmd ) {

		case Language.INSERT:
			create( obj.language_id, obj.language_name, obj.status, obj.language_desc );
			break;

		case Language.SELECT:
			obj = getRecord( obj.language_id );
			break;

		case Language.UPDATE:
			putRecord( obj.language_id, obj.language_name, obj.status, obj.language_desc );
			break;

		case Language.DELETE:
			delete( obj.language_id );
			break;

		}
		return( obj );
	}

	/**
	 * Set the language_name field in the language table corresponding to the given key.
	 * @param language_id the table primary key
	 * @param language_name the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setLanguageName( Integer language_id, String language_name ) throws SQLException {
		putRecord( language_id, language_name, null, null );
	}

	/**
	 * Get the language_name field from the language table corresponding to the given key.
	 * @param language_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getLanguageName( Integer language_id ) throws SQLException {
		return( ( (LanguageObject) getRecord( language_id ) ).language_name );
	}

	/**
	 * Set the status field in the language table corresponding to the given key.
	 * @param language_id the table primary key
	 * @param status the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setStatus( Integer language_id, String status ) throws SQLException {
		putRecord( language_id, null, status, null );
	}

	/**
	 * Get the status field from the language table corresponding to the given key.
	 * @param language_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getStatus( Integer language_id ) throws SQLException {
		return( ( (LanguageObject) getRecord( language_id ) ).status );
	}

	/**
	 * Set the language_desc field in the language table corresponding to the given key.
	 * @param language_id the table primary key
	 * @param language_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setLanguageDesc( Integer language_id, String language_desc ) throws SQLException {
		putRecord( language_id, null, null, language_desc );
	}

	/**
	 * Get the language_desc field from the language table corresponding to the given key.
	 * @param language_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getLanguageDesc( Integer language_id ) throws SQLException {
		return( ( (LanguageObject) getRecord( language_id ) ).language_desc );
	}

	private LanguageObject getRecord( Integer language_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		LanguageObject	obj = null;

		obj = new LanguageObject();
		String	query = "SELECT language_id, language_name, status, language_desc FROM LANGUAGE WHERE LANGUAGE_ID = " + language_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.language_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.language_id = null;
			obj.language_name = rs.getString( 2 );
			if( rs.wasNull() )
				obj.language_name = null;
			obj.status = rs.getString( 3 );
			if( rs.wasNull() )
				obj.status = null;
			obj.language_desc = rs.getString( 4 );
			if( rs.wasNull() )
				obj.language_desc = null;
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

	public int putRecord( Integer language_id, String language_name, String status, String language_desc ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE LANGUAGE SET " );
		if( language_name != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "LANGUAGE_NAME = ?" );
			count++;
		}
		if( status != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "STATUS = ?" );
			count++;
		}
		if( language_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "LANGUAGE_DESC = ?" );
			count++;
		}
		update.append( " WHERE LANGUAGE_ID = " + language_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( language_name != null )
				ps.setString( index++, language_name );
			if( status != null )
				ps.setString( index++, status );
			if( language_desc != null )
				ps.setString( index++, language_desc );
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
		String	query = "SELECT LANGUAGE_ID FROM LANGUAGE";

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

	public Lookup listLanguageIdLanguageName() throws SQLException {
		Statement	stmt = null;
		ResultSet	rs = null;
		String		query = "SELECT LANGUAGE_ID, LANGUAGE_NAME FROM LANGUAGE";
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
