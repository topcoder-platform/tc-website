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
import	com.topcoder.web.TCES.ejb.SkillLevel;
import	com.topcoder.web.TCES.ejb.SkillLevelObject;

public class SkillLevelBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public String getKey( Integer skill_level_id ) {
		String	key = "";

		key += fmt0.format( skill_level_id );
		return( key );
	}

	public String getKey( SkillLevelObject obj ) {
		return( getKey( obj.skill_level_id ) );
	}

	public void create( Integer skill_level_id, String description ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO SKILL_LEVEL VALUES (  " + skill_level_id + ", '" + description + "' )";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( insert );
			ps.executeUpdate();
		} catch( SQLException e ) {
			try { if( ps != null ) ps.close(); } catch( Exception f ) {}
			try { if( conn != null ) conn.close(); } catch( Exception f ) {}
			throw( e );
		} catch( Exception e ) {
		}
		try { if( ps != null ) ps.close(); } catch( Exception f ) {}
		try { if( conn != null ) conn.close(); } catch( Exception f ) {}
	}

	public void delete( Integer skill_level_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM SKILL_LEVEL WHERE SKILL_LEVEL_ID = " + skill_level_id;
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

	public SkillLevelObject request( int cmd, SkillLevelObject obj ) throws SQLException {

		switch( cmd ) {

		case SkillLevel.INSERT:
			create( obj.skill_level_id, obj.description );
			break;

		case SkillLevel.SELECT:
			obj = getRecord( obj.skill_level_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case SkillLevel.UPDATE:
			putRecord( obj.skill_level_id, obj.description );
			break;

		case SkillLevel.DELETE:
			delete( obj.skill_level_id );
			break;

		}
		return( obj );
	}

	public void setDescription( Integer skill_level_id, String description ) throws SQLException {
		putRecord( skill_level_id, description );
	}

	public String getDescription( Integer skill_level_id ) throws SQLException {
		SkillLevelObject	obj = null;
		String	result;

		obj = getRecord( skill_level_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.description );
	}

	private class RecordNotFoundException extends Exception {}

	private SkillLevelObject getRecord( Integer skill_level_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		String	key = getKey( skill_level_id );
		SkillLevelObject	obj = null;

		obj = new SkillLevelObject();
		String	query = "SELECT skill_level_id, description FROM SKILL_LEVEL WHERE SKILL_LEVEL_ID = " + skill_level_id;
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
			obj.description = rs.getString( 2 );
			if( rs.wasNull() )
				obj.description = null;
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

	public int putRecord(Integer skill_level_id, String description ) throws SQLException {
		String	identifier = getKey( skill_level_id );
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE SKILL_LEVEL SET " );
		if( description != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "DESCRIPTION = '" + description + "'" );
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
		String	query = "SELECT SKILL_LEVEL_ID FROM SKILL_LEVEL";

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
			  context.lookup( "jdbc/TopCoder" );
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
