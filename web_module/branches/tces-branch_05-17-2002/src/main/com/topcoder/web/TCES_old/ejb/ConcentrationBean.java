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
import	com.topcoder.web.TCES.ejb.Concentration;
import	com.topcoder.web.TCES.ejb.ConcentrationObject;

public class ConcentrationBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	public static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public String getKey( Integer concentration_id ) {
		String	key = "";

		key += fmt0.format( concentration_id );
		return( key );
	}

	public String getKey( ConcentrationObject obj ) {
		return( getKey( obj.concentration_id ) );
	}

	public void create( Integer concentration_id, Integer subject_id, Integer education_id, Integer concentration_type ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO CONCENTRATION VALUES (  " + concentration_id + ", " + subject_id + ", " + education_id + ", " + concentration_type + " )";

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

	public void delete( Integer concentration_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM CONCENTRATION WHERE CONCENTRATION_ID = " + concentration_id;
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

	public ConcentrationObject request( int cmd, ConcentrationObject obj ) throws SQLException {

		switch( cmd ) {

		case Concentration.INSERT:
			create( obj.concentration_id, obj.subject_id, obj.education_id, obj.concentration_type );
			break;

		case Concentration.SELECT:
			obj = getRecord( obj.concentration_id );
			if( obj == null )
				throw new EJBException(
				  "no matching record" );
			break;

		case Concentration.UPDATE:
			putRecord( obj.concentration_id, obj.subject_id, obj.education_id, obj.concentration_type );
			break;

		case Concentration.DELETE:
			delete( obj.concentration_id );
			break;

		}
		return( obj );
	}

	public void setSubjectId( Integer concentration_id, Integer subject_id ) throws SQLException {
		putRecord( concentration_id, subject_id, null, null );
	}

	public Integer getSubjectId( Integer concentration_id ) throws SQLException {
		ConcentrationObject	obj = null;
		Integer	result;

		obj = getRecord( concentration_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.subject_id );
	}

	public void setEducationId( Integer concentration_id, Integer education_id ) throws SQLException {
		putRecord( concentration_id, null, education_id, null );
	}

	public Integer getEducationId( Integer concentration_id ) throws SQLException {
		ConcentrationObject	obj = null;
		Integer	result;

		obj = getRecord( concentration_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.education_id );
	}

	public void setConcentrationType( Integer concentration_id, Integer concentration_type ) throws SQLException {
		putRecord( concentration_id, null, null, concentration_type );
	}

	public Integer getConcentrationType( Integer concentration_id ) throws SQLException {
		ConcentrationObject	obj = null;
		Integer	result;

		obj = getRecord( concentration_id );
		if( obj == null )
			throw new EJBException( "record not found" );
		return( obj.concentration_type );
	}

	private class RecordNotFoundException extends Exception {}

	private ConcentrationObject getRecord( Integer concentration_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		String	key = getKey( concentration_id );
		ConcentrationObject	obj = null;

		obj = new ConcentrationObject();
		String	query = "SELECT concentration_id, subject_id, education_id, concentration_type FROM CONCENTRATION WHERE CONCENTRATION_ID = " + concentration_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new RecordNotFoundException();
			obj.concentration_id = new Integer( rs.getInt( 1 ) );
			if( rs.wasNull() )
				obj.concentration_id = null;
			obj.subject_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.subject_id = null;
			obj.education_id = new Integer( rs.getInt( 3 ) );
			if( rs.wasNull() )
				obj.education_id = null;
			obj.concentration_type = new Integer( rs.getInt( 4 ) );
			if( rs.wasNull() )
				obj.concentration_type = null;
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

	public int putRecord(Integer concentration_id, Integer subject_id, Integer education_id, Integer concentration_type ) throws SQLException {
		String	identifier = getKey( concentration_id );
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE CONCENTRATION SET " );
		if( subject_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "SUBJECT_ID = " + subject_id.intValue() );
			count++;
		}
		if( education_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "EDUCATION_ID = " + education_id.intValue() );
			count++;
		}
		if( concentration_type != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "CONCENTRATION_TYPE = " + concentration_type.intValue() );
			count++;
		}
		update.append( " WHERE CONCENTRATION_ID = " + concentration_id );
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
		String	query = "SELECT CONCENTRATION_ID FROM CONCENTRATION";

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
