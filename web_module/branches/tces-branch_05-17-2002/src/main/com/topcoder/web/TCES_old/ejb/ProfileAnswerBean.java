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
import	com.topcoder.web.TCES.ejb.ProfileAnswer;
import	com.topcoder.web.TCES.ejb.ProfileAnswerObject;

/**
 * This is the implementation of the ProfileAnswer class.
 * @see com.topcoder.web.TCES.ejb.ProfileAnswer
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileAnswerBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( java.sql.Connection conn, Long answer_id, Long question_id, String text ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PROFILE_ANSWER VALUES (  " + answer_id + ", " + question_id + ", '" + text + "' )";

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

	public void create( Long answer_id, Long question_id, String text ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, answer_id, question_id, text );
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

	public void delete( Long answer_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM PROFILE_ANSWER WHERE ANSWER_ID = " + answer_id;
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

	public ProfileAnswerObject request( int cmd, ProfileAnswerObject obj ) throws SQLException {

		switch( cmd ) {

		case ProfileAnswer.INSERT:
			create( obj.answer_id, obj.question_id, obj.text );
			break;

		case ProfileAnswer.SELECT:
			obj = getRecord( obj.answer_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case ProfileAnswer.UPDATE:
			putRecord( obj.answer_id, obj.question_id, obj.text );
			break;

		case ProfileAnswer.DELETE:
			delete( obj.answer_id );
			break;

		}
		return( obj );
	}

	public void setQuestionId( Long answer_id, Long question_id ) throws SQLException {
		putRecord( answer_id, question_id, null );
	}

	public Long getQuestionId( Long answer_id ) throws SQLException {
		ProfileAnswerObject	obj = null;
		Long	result;

		obj = getRecord( answer_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.question_id );
	}

	public void setText( Long answer_id, String text ) throws SQLException {
		putRecord( answer_id, null, text );
	}

	public String getText( Long answer_id ) throws SQLException {
		ProfileAnswerObject	obj = null;
		String	result;

		obj = getRecord( answer_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.text );
	}

	private class RecordNotFoundException extends Exception {}

	private ProfileAnswerObject getRecord( Long answer_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		ProfileAnswerObject	obj = null;

		obj = new ProfileAnswerObject();
		String	query = "SELECT answer_id, question_id, text FROM PROFILE_ANSWER WHERE ANSWER_ID = " + answer_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.answer_id = new Long( rs.getLong( 1 ) );
			if( rs.wasNull() )
				obj.answer_id = null;
			obj.question_id = new Long( rs.getLong( 2 ) );
			if( rs.wasNull() )
				obj.question_id = null;
			obj.text = rs.getString( 3 );
			if( rs.wasNull() )
				obj.text = null;
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

	public int putRecord( Long answer_id, Long question_id, String text ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PROFILE_ANSWER SET " );
		if( question_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "QUESTION_ID = " + question_id.intValue() );
			count++;
		}
		if( text != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "TEXT = '" + text + "'" );
			count++;
		}
		update.append( " WHERE ANSWER_ID = " + answer_id );
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
		String	query = "SELECT ANSWER_ID FROM PROFILE_ANSWER";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Long( rs.getLong( 1 ) ) );
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
