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
import	com.topcoder.web.TCES.ejb.ProfileSkillXref;
import	com.topcoder.web.TCES.ejb.ProfileSkillXrefObject;
import	com.topcoder.web.TCES.common.*;
// import	com.topcoder.web.common.ResultSetContainer;

/**
 * This is the implementation of the ProfileSkillXref class.
 * @see com.topcoder.web.TCES.ejb.ProfileSkillXref
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileSkillXrefBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	private static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );
	private static final DecimalFormat	fmt1 = new DecimalFormat( "00000" );

	public void create( java.sql.Connection conn, Long profile_id, Integer skill_id, Integer skill_level_id ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PROFILE_SKILL_XREF VALUES (  " + profile_id + ", " + skill_id + ", " + skill_level_id + " )";

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

	public void create( Long profile_id, Integer skill_id, Integer skill_level_id ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, profile_id, skill_id, skill_level_id );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Long profile_id, Integer skill_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM PROFILE_SKILL_XREF WHERE PROFILE_ID = " + profile_id + " AND SKILL_ID = " + skill_id;
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

	public ProfileSkillXrefObject request( int cmd, ProfileSkillXrefObject obj ) throws SQLException {

		switch( cmd ) {

		case ProfileSkillXref.INSERT:
			create( obj.profile_id, obj.skill_id, obj.skill_level_id );
			break;

		case ProfileSkillXref.SELECT:
			obj = getRecord( obj.profile_id, obj.skill_id );
			break;

		case ProfileSkillXref.UPDATE:
			putRecord( obj.profile_id, obj.skill_id, obj.skill_level_id );
			break;

		case ProfileSkillXref.DELETE:
			delete( obj.profile_id, obj.skill_id );
			break;

		}
		return( obj );
	}

	public void setSkillLevelId( Long profile_id, Integer skill_id, Integer skill_level_id ) throws SQLException {
		putRecord( profile_id, skill_id, skill_level_id );
	}

	public Integer getSkillLevelId( Long profile_id, Integer skill_id ) throws SQLException {
		return( ( (ProfileSkillXrefObject) getRecord( profile_id, skill_id ) ).skill_level_id );
	}

	private ProfileSkillXrefObject getRecord( Long profile_id, Integer skill_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		ProfileSkillXrefObject	obj = null;

		obj = new ProfileSkillXrefObject();
		String	query = "SELECT profile_id, skill_id, skill_level_id FROM PROFILE_SKILL_XREF WHERE PROFILE_ID = " + profile_id + " AND SKILL_ID = " + skill_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.profile_id = new Long( rs.getLong( 1 ) );
			if( rs.wasNull() )
				obj.profile_id = null;
			obj.skill_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.skill_id = null;
			obj.skill_level_id = new Integer( rs.getInt( 3 ) );
			if( rs.wasNull() )
				obj.skill_level_id = null;
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

	public int putRecord( Long profile_id, Integer skill_id, Integer skill_level_id ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PROFILE_SKILL_XREF SET " );
		if( skill_level_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SKILL_LEVEL_ID = " + skill_level_id.intValue() );
			count++;
		}
		update.append( " WHERE PROFILE_ID = " + profile_id + " AND SKILL_ID = " + skill_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
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

	public Hashtable list() throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Hashtable	results = new Hashtable();
		String	query = "SELECT PROFILE_ID, SKILL_ID FROM PROFILE_SKILL_XREF";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.put( new Long( rs.getLong( 1 ) ), new Integer( rs.getInt( 2 ) ) );
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
		}
		return( results );
	}

	public String findBySkillId( Integer skill_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = null;

		try {
			conn = getConnection();
			query = "SELECT PROFILE_ID FROM PROFILE_SKILL_XREF WHERE SKILL_ID = " + skill_id;
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Long( rs.getLong( 1 ) ) );
			rs.close();
		} catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {}
			if( conn != null ) try { conn.close(); } catch( Exception f ) {}
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

	public int[] listSkillIdByProfileId( Long profileId )
	  throws SQLException {
		Vector			v = new Vector();
		Connection		conn = null;
		String			select = "SELECT SKILL.SKILL_ID FROM " +
		  "PROFILE_SKILL_XREF, SKILL WHERE " +
		  "PROFILE_SKILL_XREF.SKILL_ID = SKILL.SKILL_ID AND " +
		  "PROFILE_SKILL_XREF.PROFILE_ID = " + profileId.intValue() +
		  " ORDER BY SKILL.SKILL_ORDER";
		PreparedStatement	ps = null;
		ResultSet		rs = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( select );
			rs = ps.executeQuery();
			while( rs.next() )
				v.add( new Integer( rs.getInt( 1 ) ) );
		}
		catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {};
			if( ps != null ) try { ps.close(); } catch( SQLException e ) {};
			if( conn != null ) try { conn.close(); } catch( Exception e ) {};
		}

		int	result[] = new int[v.size()];
		Enumeration	e = v.elements();
		int	index = 0;
		while( e.hasMoreElements() )
			result[index++] = ( (Integer) e.nextElement() ).intValue();
		return( result );
	}

	public Hashtable listSkillIdSkillLevelIdByProfileId( Long profileId )
	  throws SQLException {
		Hashtable		result = new Hashtable();
		Connection		conn = null;
		String			select = "SELECT SKILL.SKILL_ID, " +
		  "SKILL_LEVEL_ID FROM " +
		  "PROFILE_SKILL_XREF, SKILL WHERE " +
		  "PROFILE_SKILL_XREF.SKILL_ID = SKILL.SKILL_ID AND " +
		  "PROFILE_SKILL_XREF.PROFILE_ID = " + profileId.intValue() +
		  " ORDER BY SKILL.SKILL_ORDER";
		PreparedStatement	ps = null;
		ResultSet		rs = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( select );
			rs = ps.executeQuery();
			while( rs.next() )
				result.put( new Integer( rs.getInt( 1 ) ),
				  new Integer( rs.getInt( 2 ) ) );
		}
		catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {};
			if( ps != null ) try { ps.close(); } catch( SQLException e ) {};
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
