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
import	com.topcoder.web.TCES.ejb.ConcentrationObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the Concentration class.
 * @author Phil Selby, May 22nd, 2002
 */

public class Concentration {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public Concentration( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( java.sql.Connection conn, Long concentration_id, Integer concentration_type_id, Long education_id, Integer subject_id ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO CONCENTRATION VALUES (  " + concentration_id + ", " + concentration_type_id + ", " + education_id + ", " + subject_id + " )";

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

	public void create( Long concentration_id, Integer concentration_type_id, Long education_id, Integer subject_id ) throws SQLException {
		try {
			create( conn, concentration_id, concentration_type_id, education_id, subject_id );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Long concentration_id ) throws SQLException {
		String	delete = "DELETE FROM CONCENTRATION WHERE CONCENTRATION_ID = " + concentration_id;
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

	public ConcentrationObject request( int cmd, ConcentrationObject obj ) throws SQLException {

		switch( cmd ) {

		case Concentration.INSERT:
			create( obj.concentration_id, obj.concentration_type_id, obj.education_id, obj.subject_id );
			break;

		case Concentration.SELECT:
			obj = getRecord( obj.concentration_id );
			break;

		case Concentration.UPDATE:
			putRecord( obj.concentration_id, obj.concentration_type_id, obj.education_id, obj.subject_id );
			break;

		case Concentration.DELETE:
			delete( obj.concentration_id );
			break;

		}
		return( obj );
	}

	/**
	 * Set the concentration_type_id field in the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @param concentration_type_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setConcentrationTypeId( Long concentration_id, Integer concentration_type_id ) throws SQLException {
		putRecord( concentration_id, concentration_type_id, null, null );
	}

	/**
	 * Get the concentration_type_id field from the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getConcentrationTypeId( Long concentration_id ) throws SQLException {
		return( ( (ConcentrationObject) getRecord( concentration_id ) ).concentration_type_id );
	}

	/**
	 * Set the education_id field in the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @param education_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setEducationId( Long concentration_id, Long education_id ) throws SQLException {
		putRecord( concentration_id, null, education_id, null );
	}

	/**
	 * Get the education_id field from the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Long getEducationId( Long concentration_id ) throws SQLException {
		return( ( (ConcentrationObject) getRecord( concentration_id ) ).education_id );
	}

	/**
	 * Set the subject_id field in the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @param subject_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSubjectId( Long concentration_id, Integer subject_id ) throws SQLException {
		putRecord( concentration_id, null, null, subject_id );
	}

	/**
	 * Get the subject_id field from the concentration table corresponding to the given key.
	 * @param concentration_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getSubjectId( Long concentration_id ) throws SQLException {
		return( ( (ConcentrationObject) getRecord( concentration_id ) ).subject_id );
	}

	private ConcentrationObject getRecord( Long concentration_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		ConcentrationObject	obj = null;

		obj = new ConcentrationObject();
		String	query = "SELECT concentration_id, concentration_type_id, education_id, subject_id FROM CONCENTRATION WHERE CONCENTRATION_ID = " + concentration_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.concentration_id = new Long( rs.getLong( 1 ) );
			if( rs.wasNull() )
				obj.concentration_id = null;
			obj.concentration_type_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.concentration_type_id = null;
			obj.education_id = new Long( rs.getLong( 3 ) );
			if( rs.wasNull() )
				obj.education_id = null;
			obj.subject_id = new Integer( rs.getInt( 4 ) );
			if( rs.wasNull() )
				obj.subject_id = null;
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

	public int putRecord( Long concentration_id, Integer concentration_type_id, Long education_id, Integer subject_id ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE CONCENTRATION SET " );
		if( concentration_type_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "CONCENTRATION_TYPE_ID = " + concentration_type_id.intValue() );
			count++;
		}
		if( education_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "EDUCATION_ID = " + education_id.intValue() );
			count++;
		}
		if( subject_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SUBJECT_ID = " + subject_id.intValue() );
			count++;
		}
		update.append( " WHERE CONCENTRATION_ID = " + concentration_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
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
		String	query = "SELECT CONCENTRATION_ID FROM CONCENTRATION";

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Long( rs.getLong( 1 ) ) );
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
