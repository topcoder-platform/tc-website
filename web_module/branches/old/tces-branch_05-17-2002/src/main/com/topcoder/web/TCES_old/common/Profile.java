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
import	com.topcoder.web.TCES.ejb.ProfileObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the Profile class.
 * @author Phil Selby, May 22nd, 2002
 */

public class Profile {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public Profile( Connection conn ) {
		this.conn = conn;
	}

	private static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( java.sql.Connection conn, Long profile_id, Date date_available, Integer profile_status_id, Integer preference_travel_level_id, Integer preference_travel_time_id, Integer preference_salary_id ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PROFILE VALUES (  " + profile_id + ", ?, " + profile_status_id + ", " + preference_travel_level_id + ", " + preference_travel_time_id + ", " + preference_salary_id + " )";

		try {
			ps = conn.prepareStatement( insert );
			ps.setDate( 1, date_available );
			ps.executeUpdate();
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {};
		}
	}

	public void create( Long profile_id, Date date_available, Integer profile_status_id, Integer preference_travel_level_id, Integer preference_travel_time_id, Integer preference_salary_id ) throws SQLException {
		try {
			create( conn, profile_id, date_available, profile_status_id, preference_travel_level_id, preference_travel_time_id, preference_salary_id );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( Long profile_id ) throws SQLException {
		String	delete = "DELETE FROM PROFILE WHERE PROFILE_ID = " + profile_id;
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

	public ProfileObject request( int cmd, ProfileObject obj ) throws SQLException {

		switch( cmd ) {

		case Profile.INSERT:
			create( obj.profile_id, obj.date_available, obj.profile_status_id, obj.preference_travel_level_id, obj.preference_travel_time_id, obj.preference_salary_id );
			break;

		case Profile.SELECT:
			obj = getRecord( obj.profile_id );
			break;

		case Profile.UPDATE:
			putRecord( obj.profile_id, obj.date_available, obj.profile_status_id, obj.preference_travel_level_id, obj.preference_travel_time_id, obj.preference_salary_id );
			break;

		case Profile.DELETE:
			delete( obj.profile_id );
			break;

		}
		return( obj );
	}

	/**
	 * Set the date_available field in the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param date_available the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDateAvailable( Long profile_id, Date date_available ) throws SQLException {
		putRecord( profile_id, date_available, null, null, null, null );
	}

	/**
	 * Get the date_available field from the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Date getDateAvailable( Long profile_id ) throws SQLException {
		return( ( (ProfileObject) getRecord( profile_id ) ).date_available );
	}

	/**
	 * Set the profile_status_id field in the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param profile_status_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setProfileStatusId( Long profile_id, Integer profile_status_id ) throws SQLException {
		putRecord( profile_id, null, profile_status_id, null, null, null );
	}

	/**
	 * Get the profile_status_id field from the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getProfileStatusId( Long profile_id ) throws SQLException {
		return( ( (ProfileObject) getRecord( profile_id ) ).profile_status_id );
	}

	/**
	 * Set the preference_travel_level_id field in the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param preference_travel_level_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setPreferenceTravelLevelId( Long profile_id, Integer preference_travel_level_id ) throws SQLException {
		putRecord( profile_id, null, null, preference_travel_level_id, null, null );
	}

	/**
	 * Get the preference_travel_level_id field from the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getPreferenceTravelLevelId( Long profile_id ) throws SQLException {
		return( ( (ProfileObject) getRecord( profile_id ) ).preference_travel_level_id );
	}

	/**
	 * Set the preference_travel_time_id field in the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param preference_travel_time_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setPreferenceTravelTimeId( Long profile_id, Integer preference_travel_time_id ) throws SQLException {
		putRecord( profile_id, null, null, null, preference_travel_time_id, null );
	}

	/**
	 * Get the preference_travel_time_id field from the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getPreferenceTravelTimeId( Long profile_id ) throws SQLException {
		return( ( (ProfileObject) getRecord( profile_id ) ).preference_travel_time_id );
	}

	/**
	 * Set the preference_salary_id field in the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @param preference_salary_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setPreferenceSalaryId( Long profile_id, Integer preference_salary_id ) throws SQLException {
		putRecord( profile_id, null, null, null, null, preference_salary_id );
	}

	/**
	 * Get the preference_salary_id field from the profile table corresponding to the given key.
	 * @param profile_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getPreferenceSalaryId( Long profile_id ) throws SQLException {
		return( ( (ProfileObject) getRecord( profile_id ) ).preference_salary_id );
	}

	private ProfileObject getRecord( Long profile_id ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		ProfileObject	obj = null;

		obj = new ProfileObject();
		String	query = "SELECT profile_id, date_available, profile_status_id, preference_travel_level_id, preference_travel_time_id, preference_salary_id FROM PROFILE WHERE PROFILE_ID = " + profile_id;
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.profile_id = new Long( rs.getLong( 1 ) );
			if( rs.wasNull() )
				obj.profile_id = null;
			obj.date_available  = rs.getDate( 2 );
			if( rs.wasNull() )
				obj.date_available = null;
			obj.profile_status_id = new Integer( rs.getInt( 3 ) );
			if( rs.wasNull() )
				obj.profile_status_id = null;
			obj.preference_travel_level_id = new Integer( rs.getInt( 4 ) );
			if( rs.wasNull() )
				obj.preference_travel_level_id = null;
			obj.preference_travel_time_id = new Integer( rs.getInt( 5 ) );
			if( rs.wasNull() )
				obj.preference_travel_time_id = null;
			obj.preference_salary_id = new Integer( rs.getInt( 6 ) );
			if( rs.wasNull() )
				obj.preference_salary_id = null;
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

	public int putRecord( Long profile_id, Date date_available, Integer profile_status_id, Integer preference_travel_level_id, Integer preference_travel_time_id, Integer preference_salary_id ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PROFILE SET " );
		if( date_available != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "DATE_AVAILABLE = ?" );
			count++;
		}
		if( profile_status_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PROFILE_STATUS_ID = " + profile_status_id.intValue() );
			count++;
		}
		if( preference_travel_level_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PREFERENCE_TRAVEL_LEVEL_ID = " + preference_travel_level_id.intValue() );
			count++;
		}
		if( preference_travel_time_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PREFERENCE_TRAVEL_TIME_ID = " + preference_travel_time_id.intValue() );
			count++;
		}
		if( preference_salary_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PREFERENCE_SALARY_ID = " + preference_salary_id.intValue() );
			count++;
		}
		update.append( " WHERE PROFILE_ID = " + profile_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( date_available != null )
				ps.setDate( index++, date_available );
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
		String	query = "SELECT PROFILE_ID FROM PROFILE";

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
