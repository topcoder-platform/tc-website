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
import	com.topcoder.web.TCES.ejb.CountryObject;
import	com.topcoder.web.TCES.common.*;
import	com.topcoder.web.TCES.common.Lookup;

/**
 * This is the implementation of the Country class.
 * @author Phil Selby, May 22nd, 2002
 */

public class Country {

	public SessionContext	context = null;
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;
	Connection	conn = null;

	public Country( Connection conn ) {
		this.conn = conn;
	}


	public void create( java.sql.Connection conn, String country_code, String country_name, Integer participating, Long default_taxform_id ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO COUNTRY VALUES (  '" + country_code + "', '" + country_name + "', " + participating + ", " + default_taxform_id + " )";

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

	public void create( String country_code, String country_name, Integer participating, Long default_taxform_id ) throws SQLException {
		try {
			create( conn, country_code, country_name, participating, default_taxform_id );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
		}
	}

	public void delete( String country_code ) throws SQLException {
		String	delete = "DELETE FROM COUNTRY WHERE COUNTRY_CODE = '" + country_code + "'";
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

	public CountryObject request( int cmd, CountryObject obj ) throws SQLException {

		switch( cmd ) {

		case Country.INSERT:
			create( obj.country_code, obj.country_name, obj.participating, obj.default_taxform_id );
			break;

		case Country.SELECT:
			obj = getRecord( obj.country_code );
			break;

		case Country.UPDATE:
			putRecord( obj.country_code, obj.country_name, obj.participating, obj.default_taxform_id );
			break;

		case Country.DELETE:
			delete( obj.country_code );
			break;

		}
		return( obj );
	}

	/**
	 * Set the country_name field in the country table corresponding to the given key.
	 * @param country_code the table primary key
	 * @param country_name the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setCountryName( String country_code, String country_name ) throws SQLException {
		putRecord( country_code, country_name, null, null );
	}

	/**
	 * Get the country_name field from the country table corresponding to the given key.
	 * @param country_code the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String getCountryName( String country_code ) throws SQLException {
		return( ( (CountryObject) getRecord( country_code ) ).country_name );
	}

	/**
	 * Set the participating field in the country table corresponding to the given key.
	 * @param country_code the table primary key
	 * @param participating the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setParticipating( String country_code, Integer participating ) throws SQLException {
		putRecord( country_code, null, participating, null );
	}

	/**
	 * Get the participating field from the country table corresponding to the given key.
	 * @param country_code the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getParticipating( String country_code ) throws SQLException {
		return( ( (CountryObject) getRecord( country_code ) ).participating );
	}

	/**
	 * Set the default_taxform_id field in the country table corresponding to the given key.
	 * @param country_code the table primary key
	 * @param default_taxform_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setDefaultTaxformId( String country_code, Long default_taxform_id ) throws SQLException {
		putRecord( country_code, null, null, default_taxform_id );
	}

	/**
	 * Get the default_taxform_id field from the country table corresponding to the given key.
	 * @param country_code the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Long getDefaultTaxformId( String country_code ) throws SQLException {
		return( ( (CountryObject) getRecord( country_code ) ).default_taxform_id );
	}

	private CountryObject getRecord( String country_code ) throws SQLException {
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		CountryObject	obj = null;

		obj = new CountryObject();
		String	query = "SELECT country_code, country_name, participating, default_taxform_id FROM COUNTRY WHERE COUNTRY_CODE = '" + country_code + "'";
		InputStream	is = null;

		try {
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.country_code = rs.getString( 1 );
			if( rs.wasNull() )
				obj.country_code = null;
			obj.country_name = rs.getString( 2 );
			if( rs.wasNull() )
				obj.country_name = null;
			obj.participating = new Integer( rs.getInt( 3 ) );
			if( rs.wasNull() )
				obj.participating = null;
			obj.default_taxform_id = new Long( rs.getLong( 4 ) );
			if( rs.wasNull() )
				obj.default_taxform_id = null;
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

	public int putRecord( String country_code, String country_name, Integer participating, Long default_taxform_id ) throws SQLException {
		PreparedStatement	ps = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE COUNTRY SET " );
		if( country_name != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "COUNTRY_NAME = ?" );
			count++;
		}
		if( participating != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "PARTICIPATING = " + participating.intValue() );
			count++;
		}
		if( default_taxform_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "DEFAULT_TAXFORM_ID = " + default_taxform_id.intValue() );
			count++;
		}
		update.append( " WHERE COUNTRY_CODE = '" + country_code + "'" );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( country_name != null )
				ps.setString( index++, country_name );
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
		String	query = "SELECT COUNTRY_CODE FROM COUNTRY";

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

	public Lookup listCountryCodeCountryName() throws SQLException {
		Statement	stmt = null;
		ResultSet	rs = null;
		String		query = "SELECT COUNTRY_CODE, COUNTRY_NAME FROM COUNTRY";
		Lookup		result = new Lookup();

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery( query );
			while( rs.next() )
				result.addPair( rs.getString( 1 ),
				  rs.getString( 2 ) );
		}
		catch( SQLException e ) {
			throw( e );
		}
		finally {
			if( rs != null ) try { rs.close(); } catch( Exception e ) {};
			if( stmt != null ) try { stmt.close(); } catch( Exception e ) {};
		}
		return( result );
	}
}
