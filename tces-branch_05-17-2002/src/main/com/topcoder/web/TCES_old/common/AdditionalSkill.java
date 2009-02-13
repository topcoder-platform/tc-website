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
import	com.topcoder.web.TCES.ejb.AdditionalSkillObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the AdditionalSkill class.
 * @author Phil Selby, May 22nd, 2002
 */

public class AdditionalSkill {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public AdditionalSkill( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( java.sql.Connection conn, Long additional_skill_id, Long profile_id, String skill_type, String description ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO ADDITIONAL_SKILL VALUES (  " + additional_skill_id + ", " + profile_id + ", '" + skill_type + "', '" + description + "' )";

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

	public void create( Long additional_skill_id, Long profile_id, String skill_type, String description ) throws SQLException {
		try {
			create( conn, additional_skill_id, profile_id, skill_type, description );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Long additional_skill_id ) throws SQLException {
		String	delete = "DELETE FROM ADDITIONAL_SKILL WHERE ADDITIONAL_SKILL_ID = " + additional_skill_id;
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

	public AdditionalSkillObject request( int cmd, AdditionalSkillObject obj ) throws SQLException {

		switch( cmd ) {

		case AdditionalSkill.INSERT:
			create( obj.additional_skill_id, obj.profile_id, obj.skill_type, obj.description );
			break;

		case AdditionalSkill.SELECT:
			obj = getRecord( obj.additional_skill_id );
			break;

		case AdditionalSkill.UPDATE:
			putRecord( obj.additional_skill_id, obj.profile_id, obj.skill_type, obj.description );
			break;

		case AdditionalSkill.DELETE:
			delete( obj.additional_skill_id );
			break;

		}
		return( obj );
	}

	/**
	 * Set the profile_id field in the additional_skill table corresponding to the given key.
	 * @param additional_skill_id the table primary key
	 * @param profile_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileId( Long additional_skill_id, Long profile_id ) throws SQLException {
		putRecord( additional_skill_id, profile_id, null, null );
	}

	/**
	 * Get the profile_id field from the additional_skill table corresponding to the given key.
	 * @param additional_skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Long getProfileId( Long additional_skill_id ) throws SQLException {
		return( ( (AdditionalSkillObject) getRecord( additional_skill_id ) ).profile_id );
	}

	/**
	 * Set the skill_type field in the additional_skill table corresponding to the given key.
	 * @param additional_skill_id the table primary key
	 * @param skill_type the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSkillType( Long additional_skill_id, String skill_type ) throws SQLException {
		putRecord( additional_skill_id, null, skill_type, null );
	}

	/**
	 * Get the skill_type field from the additional_skill table corresponding to the given key.
	 * @param additional_skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getSkillType( Long additional_skill_id ) throws SQLException {
		return( ( (AdditionalSkillObject) getRecord( additional_skill_id ) ).skill_type );
	}

	/**
	 * Set the description field in the additional_skill table corresponding to the given key.
	 * @param additional_skill_id the table primary key
	 * @param description the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDescription( Long additional_skill_id, String description ) throws SQLException {
		putRecord( additional_skill_id, null, null, description );
	}

	/**
	 * Get the description field from the additional_skill table corresponding to the given key.
	 * @param additional_skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getDescription( Long additional_skill_id ) throws SQLException {
		return( ( (AdditionalSkillObject) getRecord( additional_skill_id ) ).description );
	}

	private AdditionalSkillObject getRecord( Long additional_skill_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		AdditionalSkillObject	obj = null;

		obj = new AdditionalSkillObject();
		String	query = "SELECT additional_skill_id, profile_id, skill_type, description FROM ADDITIONAL_SKILL WHERE ADDITIONAL_SKILL_ID = " + additional_skill_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.additional_skill_id = new Long( rs.getLong( 1 ) );
			if( rs.wasNull() )
				obj.additional_skill_id = null;
			obj.profile_id = new Long( rs.getLong( 2 ) );
			if( rs.wasNull() )
				obj.profile_id = null;
			obj.skill_type = rs.getString( 3 );
			if( rs.wasNull() )
				obj.skill_type = null;
			obj.description = rs.getString( 4 );
			if( rs.wasNull() )
				obj.description = null;
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

	public int putRecord( Long additional_skill_id, Long profile_id, String skill_type, String description ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE ADDITIONAL_SKILL SET " );
		if( profile_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PROFILE_ID = " + profile_id.intValue() );
			count++;
		}
		if( skill_type != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SKILL_TYPE = ?" );
			count++;
		}
		if( description != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "DESCRIPTION = ?" );
			count++;
		}
		update.append( " WHERE ADDITIONAL_SKILL_ID = " + additional_skill_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( skill_type != null )
				ps.setString( index++, skill_type );
			if( description != null )
				ps.setString( index++, description );
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
		String	query = "SELECT ADDITIONAL_SKILL_ID FROM ADDITIONAL_SKILL";

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
