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
import	com.topcoder.web.TCES.ejb.ProfileSkill;
import	com.topcoder.web.TCES.ejb.ProfileSkillObject;

/**
 * This is the implementation of the ProfileSkill class.
 * @see com.topcoder.web.TCES.ejb.ProfileSkill
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileSkillBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( Integer profile_skill_id, Integer profile_id, Integer skill_level_id, Integer skill_id, Integer proficiency ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PROFILE_SKILL VALUES (  " + profile_skill_id + ", " + profile_id + ", " + skill_level_id + ", " + skill_id + ", " + proficiency + " )";

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

	public void delete( Integer profile_skill_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM PROFILE_SKILL WHERE PROFILE_SKILL_ID = " + profile_skill_id;
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

	public ProfileSkillObject request( int cmd, ProfileSkillObject obj ) throws SQLException {

		switch( cmd ) {

		case ProfileSkill.INSERT:
			create( obj.profile_skill_id, obj.profile_id, obj.skill_level_id, obj.skill_id, obj.proficiency );
			break;

		case ProfileSkill.SELECT:
			obj = getRecord( obj.profile_skill_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case ProfileSkill.UPDATE:
			putRecord( obj.profile_skill_id, obj.profile_id, obj.skill_level_id, obj.skill_id, obj.proficiency );
			break;

		case ProfileSkill.DELETE:
			delete( obj.profile_skill_id );
			break;

		}
		return( obj );
	}

	public void setProfileId( Integer profile_skill_id, Integer profile_id ) throws SQLException {
		putRecord( profile_skill_id, profile_id, null, null, null );
	}

	public Integer getProfileId( Integer profile_skill_id ) throws SQLException {
		ProfileSkillObject	obj = null;
		Integer	result;

		obj = getRecord( profile_skill_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.profile_id );
	}

	public void setSkillLevelId( Integer profile_skill_id, Integer skill_level_id ) throws SQLException {
		putRecord( profile_skill_id, null, skill_level_id, null, null );
	}

	public Integer getSkillLevelId( Integer profile_skill_id ) throws SQLException {
		ProfileSkillObject	obj = null;
		Integer	result;

		obj = getRecord( profile_skill_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.skill_level_id );
	}

	public void setSkillId( Integer profile_skill_id, Integer skill_id ) throws SQLException {
		putRecord( profile_skill_id, null, null, skill_id, null );
	}

	public Integer getSkillId( Integer profile_skill_id ) throws SQLException {
		ProfileSkillObject	obj = null;
		Integer	result;

		obj = getRecord( profile_skill_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.skill_id );
	}

	public void setProficiency( Integer profile_skill_id, Integer proficiency ) throws SQLException {
		putRecord( profile_skill_id, null, null, null, proficiency );
	}

	public Integer getProficiency( Integer profile_skill_id ) throws SQLException {
		ProfileSkillObject	obj = null;
		Integer	result;

		obj = getRecord( profile_skill_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.proficiency );
	}

	private class RecordNotFoundException extends Exception {}

	private ProfileSkillObject getRecord( Integer profile_skill_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		ProfileSkillObject	obj = null;

		obj = new ProfileSkillObject();
		String	query = "SELECT profile_skill_id, profile_id, skill_level_id, skill_id, proficiency FROM PROFILE_SKILL WHERE PROFILE_SKILL_ID = " + profile_skill_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.profile_skill_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.profile_skill_id = null;
			obj.profile_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.profile_id = null;
			obj.skill_level_id = new Integer( rs.getInt( 3 ) );
			if( rs.wasNull() )
				obj.skill_level_id = null;
			obj.skill_id = new Integer( rs.getInt( 4 ) );
			if( rs.wasNull() )
				obj.skill_id = null;
			obj.proficiency = new Integer( rs.getInt( 5 ) );
			if( rs.wasNull() )
				obj.proficiency = null;
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

	public int putRecord( Integer profile_skill_id, Integer profile_id, Integer skill_level_id, Integer skill_id, Integer proficiency ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PROFILE_SKILL SET " );
		if( profile_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PROFILE_ID = " + profile_id.intValue() );
			count++;
		}
		if( skill_level_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SKILL_LEVEL_ID = " + skill_level_id.intValue() );
			count++;
		}
		if( skill_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SKILL_ID = " + skill_id.intValue() );
			count++;
		}
		if( proficiency != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PROFICIENCY = " + proficiency.intValue() );
			count++;
		}
		update.append( " WHERE PROFILE_SKILL_ID = " + profile_skill_id );
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
		String	query = "SELECT PROFILE_SKILL_ID FROM PROFILE_SKILL";

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
