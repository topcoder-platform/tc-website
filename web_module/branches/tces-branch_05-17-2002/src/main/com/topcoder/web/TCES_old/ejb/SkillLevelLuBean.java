package	com.topcoder.web.TCES.ejb;

import	java.sql.Connection;
import	java.sql.PreparedStatement;
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
import	com.topcoder.web.TCES.ejb.SkillLevelLu;
import	com.topcoder.web.TCES.ejb.SkillLevelLuObject;

/**
 * This is the implementation of the SkillLevelLu class.
 * @see com.topcoder.web.TCES.ejb.SkillLevelLu
 * @author Phil Selby, May 22nd, 2002
 */

public class SkillLevelLuBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "000" );

	public void create( java.sql.Connection conn, Integer skill_level_id, String skill_level_desc ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO SKILL_LEVEL_LU VALUES (  " + skill_level_id + ", '" + skill_level_desc + "' )";

		try {
			ps = conn.prepareStatement( insert );
			ps.executeUpdate();
		} catch( SQLException e ) {
			if( ps != null )
				try { ps.close(); } catch( Exception f ) {};
			ps = null;
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( ps != null )
				try { ps.close(); } catch( Exception f ) {};
		}
	}

	public void create( Integer skill_level_id, String skill_level_desc ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, skill_level_id, skill_level_desc );
		} catch( SQLException e ) {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {}
			conn = null;
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Integer skill_level_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM SKILL_LEVEL_LU WHERE SKILL_LEVEL_ID = " + skill_level_id;
		PreparedStatement	ps = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( delete );
			ps.executeUpdate();
		} catch( SQLException e ) {
			try { if( ps != null ) ps.close(); } catch( Exception f ) {}
			try { if( conn != null ) conn.close(); } catch( Exception f ) {}
			throw( e );
		}
		try { if( ps != null ) ps.close(); } catch( Exception f ) {}
		try { if( conn != null ) conn.close(); } catch( Exception f ) {}
	}

	public SkillLevelLuObject request( int cmd, SkillLevelLuObject obj ) throws SQLException {

		switch( cmd ) {

		case SkillLevelLu.INSERT:
			create( obj.skill_level_id, obj.skill_level_desc );
			break;

		case SkillLevelLu.SELECT:
			obj = getRecord( obj.skill_level_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
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

	public void setSkillLevelDesc( Integer skill_level_id, String skill_level_desc ) throws SQLException {
		putRecord( skill_level_id, skill_level_desc );
	}

	public String getSkillLevelDesc( Integer skill_level_id ) throws SQLException {
		SkillLevelLuObject	obj = null;
		String	result;

		obj = getRecord( skill_level_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.skill_level_desc );
	}

	private class RecordNotFoundException extends Exception {}

	private SkillLevelLuObject getRecord( Integer skill_level_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		SkillLevelLuObject	obj = null;

		obj = new SkillLevelLuObject();
		String	query = "SELECT skill_level_id, skill_level_desc FROM SKILL_LEVEL_LU WHERE SKILL_LEVEL_ID = " + skill_level_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.skill_level_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.skill_level_id = null;
			obj.skill_level_desc = rs.getString( 2 );
			if( rs.wasNull() )
				obj.skill_level_desc = null;
			rs.close();
		} catch( SQLException e ) {
			try { if( ps != null ) ps.close(); } catch( Exception f ) {}
			try { if( conn != null ) conn.close(); } catch( Exception f ) {}
			throw( e );
		} catch( Exception e ) {
			obj = null;
		}
		try { if( ps != null ) ps.close(); } catch( Exception f ) {}
		try { if( conn != null ) conn.close(); } catch( Exception f ) {}
		return( obj );
	}

	public int putRecord( Integer skill_level_id, String skill_level_desc ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE SKILL_LEVEL_LU SET " );
		if( skill_level_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SKILL_LEVEL_DESC = '" + skill_level_desc + "'" );
			count++;
		}
		update.append( " WHERE SKILL_LEVEL_ID = " + skill_level_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			rc = ps.executeUpdate();
		} catch( SQLException e ) {
			try { if( ps != null ) ps.close(); } catch( Exception f ) {}
			try { if( conn != null ) conn.close(); } catch( Exception f ) {}
			throw( e );
		} catch( Exception e ) {
		}
		try { if( ps != null ) ps.close(); } catch( Exception f ) {}
		try { if( conn != null ) conn.close(); } catch( Exception f ) {}
		return( rc );
	}

	public String list() throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = "SELECT SKILL_LEVEL_ID FROM SKILL_LEVEL_LU";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Integer( rs.getInt( 1 ) ) );
		} catch( SQLException e ) {
			try { if( ps != null ) ps.close(); } catch( Exception f ) {}
			try { if( conn != null ) conn.close(); } catch( Exception f ) {}
			throw( e );
		}
		try { if( ps != null ) ps.close(); } catch( Exception f ) {}
		try { if( conn != null ) conn.close(); } catch( Exception f ) {}
		return( flatten( results ) );
	}

	public Hashtable listContent() throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Hashtable	results = new Hashtable();
		String	query = "SELECT SKILL_LEVEL_ID, skill_level_desc FROM SKILL_LEVEL_LU";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.put( new Integer( rs.getInt( 1 ) ), rs.getString( 2 ) );
		} catch( SQLException e ) {
			try { if( ps != null ) ps.close(); } catch( Exception f ) {}
			try { if( conn != null ) conn.close(); } catch( Exception f ) {}
			throw( e );
		}
		try { if( ps != null ) ps.close(); } catch( Exception f ) {}
		try { if( conn != null ) conn.close(); } catch( Exception f ) {}
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


	private Connection getConnection() throws SQLException {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)
			  context.lookup( "jdbc/TCES" );
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
