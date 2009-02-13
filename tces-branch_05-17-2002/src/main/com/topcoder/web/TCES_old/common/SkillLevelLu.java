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
import	com.topcoder.web.TCES.ejb.SkillLevelLuObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the SkillLevelLu class.
 * @author Phil Selby, May 22nd, 2002
 */

public class SkillLevelLu {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public SkillLevelLu( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer skill_level_id, String skill_level_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO SKILL_LEVEL_LU VALUES (  " + skill_level_id + ", '" + skill_level_desc + "' )";

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

	public void create( Integer skill_level_id, String skill_level_desc ) throws SQLException {
		try {
			create( conn, skill_level_id, skill_level_desc );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Integer skill_level_id ) throws SQLException {
		String	delete = "DELETE FROM SKILL_LEVEL_LU WHERE SKILL_LEVEL_ID = " + skill_level_id;
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

	public SkillLevelLuObject request( int cmd, SkillLevelLuObject obj ) throws SQLException {

		switch( cmd ) {

		case SkillLevelLu.INSERT:
			create( obj.skill_level_id, obj.skill_level_desc );
			break;

		case SkillLevelLu.SELECT:
			obj = getRecord( obj.skill_level_id );
			break;

		case SkillLevelLu.UPDATE:
			putRecord( obj.skill_level_id, obj.skill_level_desc );
			break;

		case SkillLevelLu.DELETE:
			delete( obj.skill_level_id );
			break;

		}
		return( obj );
	}

	/**
	 * Set the skill_level_desc field in the skill_level_lu table corresponding to the given key.
	 * @param skill_level_id the table primary key
	 * @param skill_level_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSkillLevelDesc( Integer skill_level_id, String skill_level_desc ) throws SQLException {
		putRecord( skill_level_id, skill_level_desc );
	}

	/**
	 * Get the skill_level_desc field from the skill_level_lu table corresponding to the given key.
	 * @param skill_level_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getSkillLevelDesc( Integer skill_level_id ) throws SQLException {
		return( ( (SkillLevelLuObject) getRecord( skill_level_id ) ).skill_level_desc );
	}

	private SkillLevelLuObject getRecord( Integer skill_level_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		SkillLevelLuObject	obj = null;

		obj = new SkillLevelLuObject();
		String	query = "SELECT skill_level_id, skill_level_desc FROM SKILL_LEVEL_LU WHERE SKILL_LEVEL_ID = " + skill_level_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.skill_level_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.skill_level_id = null;
			obj.skill_level_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.skill_level_desc = null;
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

	public int putRecord( Integer skill_level_id, String skill_level_desc ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE SKILL_LEVEL_LU SET " );
		if( skill_level_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SKILL_LEVEL_DESC = ?" );
			count++;
		}
		update.append( " WHERE SKILL_LEVEL_ID = " + skill_level_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( skill_level_desc != null )
				ps.setString( index++, skill_level_desc );
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
		String	query = "SELECT SKILL_LEVEL_ID FROM SKILL_LEVEL_LU";

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
		String	query = "SELECT SKILL_LEVEL_ID, skill_level_desc FROM SKILL_LEVEL_LU";

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
