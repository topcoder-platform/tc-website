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
import	com.topcoder.web.TCES.ejb.ProfileResponse;
import	com.topcoder.web.TCES.ejb.ProfileResponseObject;

/**
 * This is the implementation of the ProfileResponse class.
 * @see com.topcoder.web.TCES.ejb.ProfileResponse
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileResponseBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( Integer response_id, Integer question_id, Integer profile_id, Integer answer_id, String text, Integer whatisthis, Date when ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PROFILE_RESPONSE VALUES (  " + response_id + ", " + question_id + ", " + profile_id + ", " + answer_id + ", '" + text + "', " + whatisthis + ", ? )";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( insert );
			ps.setDate( 1, when );
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

	public void delete( Integer response_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM PROFILE_RESPONSE WHERE RESPONSE_ID = " + response_id;
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

	public ProfileResponseObject request( int cmd, ProfileResponseObject obj ) throws SQLException {

		switch( cmd ) {

		case ProfileResponse.INSERT:
			create( obj.response_id, obj.question_id, obj.profile_id, obj.answer_id, obj.text, obj.whatisthis, obj.when );
			break;

		case ProfileResponse.SELECT:
			obj = getRecord( obj.response_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case ProfileResponse.UPDATE:
			putRecord( obj.response_id, obj.question_id, obj.profile_id, obj.answer_id, obj.text, obj.whatisthis, obj.when );
			break;

		case ProfileResponse.DELETE:
			delete( obj.response_id );
			break;

		}
		return( obj );
	}

	public void setQuestionId( Integer response_id, Integer question_id ) throws SQLException {
		putRecord( response_id, question_id, null, null, null, null, null );
	}

	public Integer getQuestionId( Integer response_id ) throws SQLException {
		ProfileResponseObject	obj = null;
		Integer	result;

		obj = getRecord( response_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.question_id );
	}

	public void setProfileId( Integer response_id, Integer profile_id ) throws SQLException {
		putRecord( response_id, null, profile_id, null, null, null, null );
	}

	public Integer getProfileId( Integer response_id ) throws SQLException {
		ProfileResponseObject	obj = null;
		Integer	result;

		obj = getRecord( response_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.profile_id );
	}

	public void setAnswerId( Integer response_id, Integer answer_id ) throws SQLException {
		putRecord( response_id, null, null, answer_id, null, null, null );
	}

	public Integer getAnswerId( Integer response_id ) throws SQLException {
		ProfileResponseObject	obj = null;
		Integer	result;

		obj = getRecord( response_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.answer_id );
	}

	public void setText( Integer response_id, String text ) throws SQLException {
		putRecord( response_id, null, null, null, text, null, null );
	}

	public String getText( Integer response_id ) throws SQLException {
		ProfileResponseObject	obj = null;
		String	result;

		obj = getRecord( response_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.text );
	}

	public void setWhatisthis( Integer response_id, Integer whatisthis ) throws SQLException {
		putRecord( response_id, null, null, null, null, whatisthis, null );
	}

	public Integer getWhatisthis( Integer response_id ) throws SQLException {
		ProfileResponseObject	obj = null;
		Integer	result;

		obj = getRecord( response_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.whatisthis );
	}

	public void setWhen( Integer response_id, Date when ) throws SQLException {
		putRecord( response_id, null, null, null, null, null, when );
	}

	public Date getWhen( Integer response_id ) throws SQLException {
		ProfileResponseObject	obj = null;
		Date	result;

		obj = getRecord( response_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.when );
	}

	private class RecordNotFoundException extends Exception {}

	private ProfileResponseObject getRecord( Integer response_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		ProfileResponseObject	obj = null;

		obj = new ProfileResponseObject();
		String	query = "SELECT response_id, question_id, profile_id, answer_id, text, whatisthis, when FROM PROFILE_RESPONSE WHERE RESPONSE_ID = " + response_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.response_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.response_id = null;
			obj.question_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.question_id = null;
			obj.profile_id = new Integer( rs.getInt( 3 ) );
			if( rs.wasNull() )
				obj.profile_id = null;
			obj.answer_id = new Integer( rs.getInt( 4 ) );
			if( rs.wasNull() )
				obj.answer_id = null;
			obj.text = rs.getString( 5 );
			if( rs.wasNull() )
				obj.text = null;
			obj.whatisthis = new Integer( rs.getInt( 6 ) );
			if( rs.wasNull() )
				obj.whatisthis = null;
			obj.when  = rs.getDate( 7 );
			if( rs.wasNull() )
				obj.when = null;
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

	public int putRecord( Integer response_id, Integer question_id, Integer profile_id, Integer answer_id, String text, Integer whatisthis, Date when ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PROFILE_RESPONSE SET " );
		if( question_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "QUESTION_ID = " + question_id.intValue() );
			count++;
		}
		if( profile_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PROFILE_ID = " + profile_id.intValue() );
			count++;
		}
		if( answer_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "ANSWER_ID = " + answer_id.intValue() );
			count++;
		}
		if( text != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "TEXT = '" + text + "'" );
			count++;
		}
		if( whatisthis != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "WHATISTHIS = " + whatisthis.intValue() );
			count++;
		}
		if( when != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "WHEN = '" + when + "'" );
			count++;
		}
		update.append( " WHERE RESPONSE_ID = " + response_id );
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
		String	query = "SELECT RESPONSE_ID FROM PROFILE_RESPONSE";

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
