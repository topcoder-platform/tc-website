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
import	com.topcoder.web.TCES.ejb.ProfileQuestion;
import	com.topcoder.web.TCES.ejb.ProfileQuestionObject;

/**
 * This is the implementation of the ProfileQuestion class.
 * @see com.topcoder.web.TCES.ejb.ProfileQuestion
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileQuestionBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( java.sql.Connection conn, Long question_id, String text, Integer question_type_id, Integer question_style_id ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PROFILE_QUESTION VALUES (  " + question_id + ", '" + text + "', " + question_type_id + ", " + question_style_id + " )";

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

	public void create( Long question_id, String text, Integer question_type_id, Integer question_style_id ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, question_id, text, question_type_id, question_style_id );
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

	public void delete( Long question_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM PROFILE_QUESTION WHERE QUESTION_ID = " + question_id;
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

	public ProfileQuestionObject request( int cmd, ProfileQuestionObject obj ) throws SQLException {

		switch( cmd ) {

		case ProfileQuestion.INSERT:
			create( obj.question_id, obj.text, obj.question_type_id, obj.question_style_id );
			break;

		case ProfileQuestion.SELECT:
			obj = getRecord( obj.question_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case ProfileQuestion.UPDATE:
			putRecord( obj.question_id, obj.text, obj.question_type_id, obj.question_style_id );
			break;

		case ProfileQuestion.DELETE:
			delete( obj.question_id );
			break;

		}
		return( obj );
	}

	public void setText( Long question_id, String text ) throws SQLException {
		putRecord( question_id, text, null, null );
	}

	public String getText( Long question_id ) throws SQLException {
		ProfileQuestionObject	obj = null;
		String	result;

		obj = getRecord( question_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.text );
	}

	public void setQuestionTypeId( Long question_id, Integer question_type_id ) throws SQLException {
		putRecord( question_id, null, question_type_id, null );
	}

	public Integer getQuestionTypeId( Long question_id ) throws SQLException {
		ProfileQuestionObject	obj = null;
		Integer	result;

		obj = getRecord( question_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.question_type_id );
	}

	public void setQuestionStyleId( Long question_id, Integer question_style_id ) throws SQLException {
		putRecord( question_id, null, null, question_style_id );
	}

	public Integer getQuestionStyleId( Long question_id ) throws SQLException {
		ProfileQuestionObject	obj = null;
		Integer	result;

		obj = getRecord( question_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.question_style_id );
	}

	private class RecordNotFoundException extends Exception {}

	private ProfileQuestionObject getRecord( Long question_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		ProfileQuestionObject	obj = null;

		obj = new ProfileQuestionObject();
		String	query = "SELECT question_id, text, question_type_id, question_style_id FROM PROFILE_QUESTION WHERE QUESTION_ID = " + question_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.question_id = new Long( rs.getLong( 1 ) );
			if( rs.wasNull() )
				obj.question_id = null;
			obj.text = rs.getString( 2 );
			if( rs.wasNull() )
				obj.text = null;
			obj.question_type_id = new Integer( rs.getInt( 3 ) );
			if( rs.wasNull() )
				obj.question_type_id = null;
			obj.question_style_id = new Integer( rs.getInt( 4 ) );
			if( rs.wasNull() )
				obj.question_style_id = null;
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

	public int putRecord( Long question_id, String text, Integer question_type_id, Integer question_style_id ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE PROFILE_QUESTION SET " );
		if( text != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "TEXT = '" + text + "'" );
			count++;
		}
		if( question_type_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "QUESTION_TYPE_ID = " + question_type_id.intValue() );
			count++;
		}
		if( question_style_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "QUESTION_STYLE_ID = " + question_style_id.intValue() );
			count++;
		}
		update.append( " WHERE QUESTION_ID = " + question_id );
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
		String	query = "SELECT QUESTION_ID FROM PROFILE_QUESTION";

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
			  context.lookup( "OLTP" );
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
