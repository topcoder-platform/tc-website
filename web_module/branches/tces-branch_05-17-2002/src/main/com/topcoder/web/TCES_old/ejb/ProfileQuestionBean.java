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

public class ProfileQuestionBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public String getKey( Integer question_id ) {
		String	key = "";

		key += fmt0.format( question_id );
		return( key );
	}

	public String getKey( ProfileQuestionObject obj ) {
		return( getKey( obj.question_id ) );
	}

	public void create( Integer question_id, String text, Integer question_type, Integer question_style ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO PROFILE_QUESTION VALUES (  " + question_id + ", '" + text + "', " + question_type + ", " + question_style + " )";

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

	public void delete( Integer question_id ) throws SQLException {
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
			create( obj.question_id, obj.text, obj.question_type, obj.question_style );
			break;

		case ProfileQuestion.SELECT:
			obj = getRecord( obj.question_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case ProfileQuestion.UPDATE:
			putRecord( obj.question_id, obj.text, obj.question_type, obj.question_style );
			break;

		case ProfileQuestion.DELETE:
			delete( obj.question_id );
			break;

		}
		return( obj );
	}

	public void setText( Integer question_id, String text ) throws SQLException {
		putRecord( question_id, text, null, null );
	}

	public String getText( Integer question_id ) throws SQLException {
		ProfileQuestionObject	obj = null;
		String	result;

		obj = getRecord( question_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.text );
	}

	public void setQuestionType( Integer question_id, Integer question_type ) throws SQLException {
		putRecord( question_id, null, question_type, null );
	}

	public Integer getQuestionType( Integer question_id ) throws SQLException {
		ProfileQuestionObject	obj = null;
		Integer	result;

		obj = getRecord( question_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.question_type );
	}

	public void setQuestionStyle( Integer question_id, Integer question_style ) throws SQLException {
		putRecord( question_id, null, null, question_style );
	}

	public Integer getQuestionStyle( Integer question_id ) throws SQLException {
		ProfileQuestionObject	obj = null;
		Integer	result;

		obj = getRecord( question_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.question_style );
	}

	private class RecordNotFoundException extends Exception {}

	private ProfileQuestionObject getRecord( Integer question_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		String	key = getKey( question_id );
		ProfileQuestionObject	obj = null;

		obj = new ProfileQuestionObject();
		String	query = "SELECT question_id, text, question_type, question_style FROM PROFILE_QUESTION WHERE QUESTION_ID = " + question_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.question_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.question_id = null;
			obj.text = rs.getString( 2 );
			if( rs.wasNull() )
				obj.text = null;
			obj.question_type = new Integer( rs.getInt( 3 ) );
			if( rs.wasNull() )
				obj.question_type = null;
			obj.question_style = new Integer( rs.getInt( 4 ) );
			if( rs.wasNull() )
				obj.question_style = null;
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

	public int putRecord(Integer question_id, String text, Integer question_type, Integer question_style ) throws SQLException {
		String	identifier = getKey( question_id );
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
		if( question_type != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "QUESTION_TYPE = " + question_type.intValue() );
			count++;
		}
		if( question_style != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "QUESTION_STYLE = " + question_style.intValue() );
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
