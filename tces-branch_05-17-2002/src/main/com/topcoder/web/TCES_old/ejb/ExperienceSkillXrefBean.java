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
import	com.topcoder.web.TCES.ejb.ExperienceSkillXref;
import	com.topcoder.web.TCES.ejb.ExperienceSkillXrefObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the ExperienceSkillXref class.
 * @see com.topcoder.web.TCES.ejb.ExperienceSkillXref
 * @author Phil Selby, May 22nd, 2002
 */

public class ExperienceSkillXrefBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	private static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );
	private static final DecimalFormat	fmt1 = new DecimalFormat( "00000" );

	public void create( java.sql.Connection conn, Long experience_id, Integer skill_id ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO EXPERIENCE_SKILL_XREF VALUES (  " + experience_id + ", " + skill_id + " )";

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

	public void create( Long experience_id, Integer skill_id ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, experience_id, skill_id );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Long experience_id, Integer skill_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM EXPERIENCE_SKILL_XREF WHERE EXPERIENCE_ID = " + experience_id + " AND SKILL_ID = " + skill_id;
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

	public ExperienceSkillXrefObject request( int cmd, ExperienceSkillXrefObject obj ) throws SQLException {

		switch( cmd ) {

		case ExperienceSkillXref.INSERT:
			create( obj.experience_id, obj.skill_id );
			break;

		case ExperienceSkillXref.SELECT:
			obj = getRecord( obj.experience_id, obj.skill_id );
			break;

		case ExperienceSkillXref.UPDATE:
			putRecord( obj.experience_id, obj.skill_id );
			break;

		case ExperienceSkillXref.DELETE:
			delete( obj.experience_id, obj.skill_id );
			break;

		}
		return( obj );
	}

	private ExperienceSkillXrefObject getRecord( Long experience_id, Integer skill_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		ExperienceSkillXrefObject	obj = null;

		obj = new ExperienceSkillXrefObject();
		String	query = "SELECT experience_id, skill_id FROM EXPERIENCE_SKILL_XREF WHERE EXPERIENCE_ID = " + experience_id + " AND SKILL_ID = " + skill_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.experience_id = new Long( rs.getLong( 1 ) );
			if( rs.wasNull() )
				obj.experience_id = null;
			obj.skill_id = new Integer( rs.getInt( 2 ) );
			if( rs.wasNull() )
				obj.skill_id = null;
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

	public int putRecord( Long experience_id, Integer skill_id ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE EXPERIENCE_SKILL_XREF SET " );
		update.append( " WHERE EXPERIENCE_ID = " + experience_id + " AND SKILL_ID = " + skill_id );
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
		String	query = "SELECT EXPERIENCE_ID, SKILL_ID FROM EXPERIENCE_SKILL_XREF";

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
			query = "SELECT EXPERIENCE_ID FROM EXPERIENCE_SKILL_XREF WHERE SKILL_ID = " + skill_id;
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
