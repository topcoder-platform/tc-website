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
import	com.topcoder.web.TCES.ejb.SkillObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the Skill class.
 * @author Phil Selby, May 22nd, 2002
 */

public class Skill {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public Skill( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "00000" );

	public void create( java.sql.Connection conn, Integer skill_id, Integer skill_type_id, String skill_desc, Integer skill_order, String status, Date modify_date, Long profile_id ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO SKILL VALUES (  " + skill_id + ", " + skill_type_id + ", '" + skill_desc + "', " + skill_order + ", '" + status + "', ?, " + profile_id + " )";

		try {
			ps = conn.prepareStatement( insert );
			ps.setDate( 1, modify_date );
			ps.executeUpdate();
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {};
		}
	}

	public void create( Integer skill_id, Integer skill_type_id, String skill_desc, Integer skill_order, String status, Date modify_date, Long profile_id ) throws SQLException {
		try {
			create( conn, skill_id, skill_type_id, skill_desc, skill_order, status, modify_date, profile_id );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Integer skill_id ) throws SQLException {
		String	delete = "DELETE FROM SKILL WHERE SKILL_ID = " + skill_id;
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

	public SkillObject request( int cmd, SkillObject obj ) throws SQLException {

		switch( cmd ) {

		case Skill.INSERT:
			create( obj.skill_id, obj.skill_type_id, obj.skill_desc, obj.skill_order, obj.status, obj.modify_date, obj.profile_id );
			break;

		case Skill.SELECT:
			obj = getRecord( obj.skill_id );
			break;

		case Skill.UPDATE:
			putRecord( obj.skill_id, obj.skill_type_id, obj.skill_desc, obj.skill_order, obj.status, obj.modify_date, obj.profile_id );
			break;

		case Skill.DELETE:
			delete( obj.skill_id );
			break;

		}
		return( obj );
	}

	/**
	 * Set the skill_type_id field in the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @param skill_type_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSkillTypeId( Integer skill_id, Integer skill_type_id ) throws SQLException {
		putRecord( skill_id, skill_type_id, null, null, null, null, null );
	}

	/**
	 * Get the skill_type_id field from the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getSkillTypeId( Integer skill_id ) throws SQLException {
		return( ( (SkillObject) getRecord( skill_id ) ).skill_type_id );
	}

	/**
	 * Set the skill_desc field in the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @param skill_desc the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSkillDesc( Integer skill_id, String skill_desc ) throws SQLException {
		putRecord( skill_id, null, skill_desc, null, null, null, null );
	}

	/**
	 * Get the skill_desc field from the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getSkillDesc( Integer skill_id ) throws SQLException {
		return( ( (SkillObject) getRecord( skill_id ) ).skill_desc );
	}

	/**
	 * Set the skill_order field in the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @param skill_order the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setSkillOrder( Integer skill_id, Integer skill_order ) throws SQLException {
		putRecord( skill_id, null, null, skill_order, null, null, null );
	}

	/**
	 * Get the skill_order field from the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getSkillOrder( Integer skill_id ) throws SQLException {
		return( ( (SkillObject) getRecord( skill_id ) ).skill_order );
	}

	/**
	 * Set the status field in the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @param status the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setStatus( Integer skill_id, String status ) throws SQLException {
		putRecord( skill_id, null, null, null, status, null, null );
	}

	/**
	 * Get the status field from the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getStatus( Integer skill_id ) throws SQLException {
		return( ( (SkillObject) getRecord( skill_id ) ).status );
	}

	/**
	 * Set the modify_date field in the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @param modify_date the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setModifyDate( Integer skill_id, Date modify_date ) throws SQLException {
		putRecord( skill_id, null, null, null, null, modify_date, null );
	}

	/**
	 * Get the modify_date field from the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getModifyDate( Integer skill_id ) throws SQLException {
		return( ( (SkillObject) getRecord( skill_id ) ).modify_date );
	}

	/**
	 * Set the profile_id field in the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @param profile_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileId( Integer skill_id, Long profile_id ) throws SQLException {
		putRecord( skill_id, null, null, null, null, null, profile_id );
	}

	/**
	 * Get the profile_id field from the skill table corresponding to the given key.
	 * @param skill_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Long getProfileId( Integer skill_id ) throws SQLException {
		return( ( (SkillObject) getRecord( skill_id ) ).profile_id );
	}

	private SkillObject getRecord( Integer skill_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		SkillObject	obj = null;

		obj = new SkillObject();
		String	query = "SELECT skill_id, skill_type_id, skill_desc, skill_order, status, modify_date, profile_id FROM SKILL WHERE SKILL_ID = " + skill_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.skill_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.skill_id = null;
			obj.skill_type_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.skill_type_id = null;
			obj.skill_desc = rs.getString( 3 );
			if( rs.wasNull() )
				obj.skill_desc = null;
			obj.skill_order = new Integer( rs.getInt( 4 ) );
			if( rs.wasNull() )
				obj.skill_order = null;
			obj.status = rs.getString( 5 );
			if( rs.wasNull() )
				obj.status = null;
			obj.modify_date  = rs.getDate( 6 );
			if( rs.wasNull() )
				obj.modify_date = null;
			obj.profile_id = new Long( rs.getLong( 7 ) );
			if( rs.wasNull() )
				obj.profile_id = null;
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

	public int putRecord( Integer skill_id, Integer skill_type_id, String skill_desc, Integer skill_order, String status, Date modify_date, Long profile_id ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE SKILL SET " );
		if( skill_type_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SKILL_TYPE_ID = " + skill_type_id.intValue() );
			count++;
		}
		if( skill_desc != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SKILL_DESC = ?" );
			count++;
		}
		if( skill_order != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SKILL_ORDER = " + skill_order.intValue() );
			count++;
		}
		if( status != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "STATUS = ?" );
			count++;
		}
		if( modify_date != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "MODIFY_DATE = ?" );
			count++;
		}
		if( profile_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PROFILE_ID = " + profile_id.intValue() );
			count++;
		}
		update.append( " WHERE SKILL_ID = " + skill_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( skill_desc != null )
				ps.setString( index++, skill_desc );
			if( status != null )
				ps.setString( index++, status );
			if( modify_date != null )
				ps.setDate( index++, modify_date );
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
		String	query = "SELECT SKILL_ID FROM SKILL";

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

	public Hashtable listSkillDescBySkillId()
	  throws SQLException {
		Hashtable		result = new Hashtable();
		String			select = "SELECT SKILL_ID, SKILL_DESC" +
		  " FROM SKILL ORDER BY SKILL_ORDER";
		PreparedStatement	ps = null;
		ResultSet		rs = null;
		Integer			skillId = null;
		String			skillDesc = null;

		try {
			ps = conn.prepareStatement( select );
			rs = ps.executeQuery();
			while( rs.next() )
				result.put( new Integer( rs.getInt( 1 ) ),
				  rs.getString( 2 ) );
		}
		catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {};
			if( ps != null ) try { ps.close(); } catch( SQLException e ) {};
		}
		return( result );
	}
}
