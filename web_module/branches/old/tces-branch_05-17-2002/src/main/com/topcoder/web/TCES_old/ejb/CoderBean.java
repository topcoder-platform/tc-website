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
import	com.topcoder.web.TCES.ejb.Coder;
import	com.topcoder.web.TCES.ejb.CoderObject;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the Coder class.
 * @see com.topcoder.web.TCES.ejb.Coder
 * @author Phil Selby, May 22nd, 2002
 */

public class CoderBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	private static final DecimalFormat	fmt0 = new DecimalFormat( "0000000000" );

	public void create( java.sql.Connection conn, Long coder_id, String state_code, String country_code, String first_name, String last_name, String home_phone, String work_phone, String address1, String address2, String city, String zip, String middle_name, String activation_code, Date member_since, String notify, String quote, String employer_search, String relocate, Date modify_date, Integer referral_id, Integer editor_id, String notify_inquiry, Long referral_user_id, Integer language_id, Integer coder_type_id, Integer image, Date date_of_birth ) throws SQLException {
		PreparedStatement	ps = null;

		String	insert = "INSERT INTO CODER VALUES (  " + coder_id + ", '" + state_code + "', '" + country_code + "', '" + first_name + "', '" + last_name + "', '" + home_phone + "', '" + work_phone + "', '" + address1 + "', '" + address2 + "', '" + city + "', '" + zip + "', '" + middle_name + "', '" + activation_code + "', ?, '" + notify + "', '" + quote + "', '" + employer_search + "', '" + relocate + "', ?, " + referral_id + ", " + editor_id + ", '" + notify_inquiry + "', " + referral_user_id + ", " + language_id + ", " + coder_type_id + ", " + image + ", ? )";

		try {
			ps = conn.prepareStatement( insert );
			ps.setDate( 1, member_since );
			ps.setDate( 2, modify_date );
			ps.setDate( 3, date_of_birth );
			ps.executeUpdate();
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		}
		finally {
			if( ps != null ) try { ps.close(); } catch( Exception f ) {};
		}
	}

	public void create( Long coder_id, String state_code, String country_code, String first_name, String last_name, String home_phone, String work_phone, String address1, String address2, String city, String zip, String middle_name, String activation_code, Date member_since, String notify, String quote, String employer_search, String relocate, Date modify_date, Integer referral_id, Integer editor_id, String notify_inquiry, Long referral_user_id, Integer language_id, Integer coder_type_id, Integer image, Date date_of_birth ) throws SQLException {
		Connection	conn = null;

		try {
			conn = getConnection();
			create( conn, coder_id, state_code, country_code, first_name, last_name, home_phone, work_phone, address1, address2, city, zip, middle_name, activation_code, member_since, notify, quote, employer_search, relocate, modify_date, referral_id, editor_id, notify_inquiry, referral_user_id, language_id, coder_type_id, image, date_of_birth );
		} catch( SQLException e ) {
			throw( e );
		} catch( Exception e ) {
		} finally {
			if( conn != null )
				try { conn.close(); } catch( Exception f ) {};
		}
	}

	public void delete( Long coder_id ) throws SQLException {
		Connection	conn = null;
		String	delete = "DELETE FROM CODER WHERE CODER_ID = " + coder_id;
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

	public CoderObject request( int cmd, CoderObject obj ) throws SQLException {

		switch( cmd ) {

		case Coder.INSERT:
			create( obj.coder_id, obj.state_code, obj.country_code, obj.first_name, obj.last_name, obj.home_phone, obj.work_phone, obj.address1, obj.address2, obj.city, obj.zip, obj.middle_name, obj.activation_code, obj.member_since, obj.notify, obj.quote, obj.employer_search, obj.relocate, obj.modify_date, obj.referral_id, obj.editor_id, obj.notify_inquiry, obj.referral_user_id, obj.language_id, obj.coder_type_id, obj.image, obj.date_of_birth );
			break;

		case Coder.SELECT:
			obj = getRecord( obj.coder_id );
			break;

		case Coder.UPDATE:
			putRecord( obj.coder_id, obj.state_code, obj.country_code, obj.first_name, obj.last_name, obj.home_phone, obj.work_phone, obj.address1, obj.address2, obj.city, obj.zip, obj.middle_name, obj.activation_code, obj.member_since, obj.notify, obj.quote, obj.employer_search, obj.relocate, obj.modify_date, obj.referral_id, obj.editor_id, obj.notify_inquiry, obj.referral_user_id, obj.language_id, obj.coder_type_id, obj.image, obj.date_of_birth );
			break;

		case Coder.DELETE:
			delete( obj.coder_id );
			break;

		}
		return( obj );
	}

	public void setStateCode( Long coder_id, String state_code ) throws SQLException {
		putRecord( coder_id, state_code, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getStateCode( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).state_code );
	}

	public void setCountryCode( Long coder_id, String country_code ) throws SQLException {
		putRecord( coder_id, null, country_code, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getCountryCode( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).country_code );
	}

	public void setFirstName( Long coder_id, String first_name ) throws SQLException {
		putRecord( coder_id, null, null, first_name, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getFirstName( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).first_name );
	}

	public void setLastName( Long coder_id, String last_name ) throws SQLException {
		putRecord( coder_id, null, null, null, last_name, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getLastName( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).last_name );
	}

	public void setHomePhone( Long coder_id, String home_phone ) throws SQLException {
		putRecord( coder_id, null, null, null, null, home_phone, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getHomePhone( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).home_phone );
	}

	public void setWorkPhone( Long coder_id, String work_phone ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, work_phone, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getWorkPhone( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).work_phone );
	}

	public void setAddress1( Long coder_id, String address1 ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, address1, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getAddress1( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).address1 );
	}

	public void setAddress2( Long coder_id, String address2 ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, address2, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getAddress2( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).address2 );
	}

	public void setCity( Long coder_id, String city ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, city, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getCity( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).city );
	}

	public void setZip( Long coder_id, String zip ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, zip, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getZip( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).zip );
	}

	public void setMiddleName( Long coder_id, String middle_name ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, middle_name, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getMiddleName( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).middle_name );
	}

	public void setActivationCode( Long coder_id, String activation_code ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, null, activation_code, null, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getActivationCode( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).activation_code );
	}

	public void setMemberSince( Long coder_id, Date member_since ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, null, null, member_since, null, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public Date getMemberSince( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).member_since );
	}

	public void setNotify( Long coder_id, String notify ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, notify, null, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getNotify( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).notify );
	}

	public void setQuote( Long coder_id, String quote ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, quote, null, null, null, null, null, null, null, null, null, null, null );
	}

	public String getQuote( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).quote );
	}

	public void setEmployerSearch( Long coder_id, String employer_search ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, employer_search, null, null, null, null, null, null, null, null, null, null );
	}

	public String getEmployerSearch( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).employer_search );
	}

	public void setRelocate( Long coder_id, String relocate ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, relocate, null, null, null, null, null, null, null, null, null );
	}

	public String getRelocate( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).relocate );
	}

	public void setModifyDate( Long coder_id, Date modify_date ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, modify_date, null, null, null, null, null, null, null, null );
	}

	public Date getModifyDate( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).modify_date );
	}

	public void setReferralId( Long coder_id, Integer referral_id ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, referral_id, null, null, null, null, null, null, null );
	}

	public Integer getReferralId( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).referral_id );
	}

	public void setEditorId( Long coder_id, Integer editor_id ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, editor_id, null, null, null, null, null, null );
	}

	public Integer getEditorId( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).editor_id );
	}

	public void setNotifyInquiry( Long coder_id, String notify_inquiry ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, notify_inquiry, null, null, null, null, null );
	}

	public String getNotifyInquiry( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).notify_inquiry );
	}

	public void setReferralUserId( Long coder_id, Long referral_user_id ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, referral_user_id, null, null, null, null );
	}

	public Long getReferralUserId( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).referral_user_id );
	}

	public void setLanguageId( Long coder_id, Integer language_id ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, language_id, null, null, null );
	}

	public Integer getLanguageId( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).language_id );
	}

	public void setCoderTypeId( Long coder_id, Integer coder_type_id ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, coder_type_id, null, null );
	}

	public Integer getCoderTypeId( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).coder_type_id );
	}

	public void setImage( Long coder_id, Integer image ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, image, null );
	}

	public Integer getImage( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).image );
	}

	public void setDateOfBirth( Long coder_id, Date date_of_birth ) throws SQLException {
		putRecord( coder_id, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, date_of_birth );
	}

	public Date getDateOfBirth( Long coder_id ) throws SQLException {
		return( ( (CoderObject) getRecord( coder_id ) ).date_of_birth );
	}

	private CoderObject getRecord( Long coder_id ) throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		CoderObject	obj = null;

		obj = new CoderObject();
		String	query = "SELECT coder_id, state_code, country_code, first_name, last_name, home_phone, work_phone, address1, address2, city, zip, middle_name, activation_code, member_since, notify, quote, employer_search, relocate, modify_date, referral_id, editor_id, notify_inquiry, referral_user_id, language_id, coder_type_id, image, date_of_birth FROM CODER WHERE CODER_ID = " + coder_id;
		InputStream	is = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			if( !rs.next() )
				throw new com.topcoder.web.TCES.common.NoRecordFoundException();
			obj.coder_id = new Long( rs.getLong( 1 ) );
			if( rs.wasNull() )
				obj.coder_id = null;
			obj.state_code = rs.getString( 2 );
			if( rs.wasNull() )
				obj.state_code = null;
			obj.country_code = rs.getString( 3 );
			if( rs.wasNull() )
				obj.country_code = null;
			obj.first_name = rs.getString( 4 );
			if( rs.wasNull() )
				obj.first_name = null;
			obj.last_name = rs.getString( 5 );
			if( rs.wasNull() )
				obj.last_name = null;
			obj.home_phone = rs.getString( 6 );
			if( rs.wasNull() )
				obj.home_phone = null;
			obj.work_phone = rs.getString( 7 );
			if( rs.wasNull() )
				obj.work_phone = null;
			obj.address1 = rs.getString( 8 );
			if( rs.wasNull() )
				obj.address1 = null;
			obj.address2 = rs.getString( 9 );
			if( rs.wasNull() )
				obj.address2 = null;
			obj.city = rs.getString( 10 );
			if( rs.wasNull() )
				obj.city = null;
			obj.zip = rs.getString( 11 );
			if( rs.wasNull() )
				obj.zip = null;
			obj.middle_name = rs.getString( 12 );
			if( rs.wasNull() )
				obj.middle_name = null;
			obj.activation_code = rs.getString( 13 );
			if( rs.wasNull() )
				obj.activation_code = null;
			obj.member_since  = rs.getDate( 14 );
			if( rs.wasNull() )
				obj.member_since = null;
			obj.notify = rs.getString( 15 );
			if( rs.wasNull() )
				obj.notify = null;
			obj.quote = rs.getString( 16 );
			if( rs.wasNull() )
				obj.quote = null;
			obj.employer_search = rs.getString( 17 );
			if( rs.wasNull() )
				obj.employer_search = null;
			obj.relocate = rs.getString( 18 );
			if( rs.wasNull() )
				obj.relocate = null;
			obj.modify_date  = rs.getDate( 19 );
			if( rs.wasNull() )
				obj.modify_date = null;
			obj.referral_id = new Integer( rs.getInt( 20 ) );
			if( rs.wasNull() )
				obj.referral_id = null;
			obj.editor_id = new Integer( rs.getInt( 21 ) );
			if( rs.wasNull() )
				obj.editor_id = null;
			obj.notify_inquiry = rs.getString( 22 );
			if( rs.wasNull() )
				obj.notify_inquiry = null;
			obj.referral_user_id = new Long( rs.getLong( 23 ) );
			if( rs.wasNull() )
				obj.referral_user_id = null;
			obj.language_id = new Integer( rs.getInt( 24 ) );
			if( rs.wasNull() )
				obj.language_id = null;
			obj.coder_type_id = new Integer( rs.getInt( 25 ) );
			if( rs.wasNull() )
				obj.coder_type_id = null;
			obj.image = new Integer( rs.getInt( 26 ) );
			if( rs.wasNull() )
				obj.image = null;
			obj.date_of_birth  = rs.getDate( 27 );
			if( rs.wasNull() )
				obj.date_of_birth = null;
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

	public int putRecord( Long coder_id, String state_code, String country_code, String first_name, String last_name, String home_phone, String work_phone, String address1, String address2, String city, String zip, String middle_name, String activation_code, Date member_since, String notify, String quote, String employer_search, String relocate, Date modify_date, Integer referral_id, Integer editor_id, String notify_inquiry, Long referral_user_id, Integer language_id, Integer coder_type_id, Integer image, Date date_of_birth ) throws SQLException {
		PreparedStatement	ps = null;
		Connection	conn = null;
		StringBuffer	update = new StringBuffer();
		int	count = 0;

		update.append( "UPDATE CODER SET " );
		if( state_code != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "STATE_CODE = ?" );
			count++;
		}
		if( country_code != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "COUNTRY_CODE = ?" );
			count++;
		}
		if( first_name != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "FIRST_NAME = ?" );
			count++;
		}
		if( last_name != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "LAST_NAME = ?" );
			count++;
		}
		if( home_phone != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "HOME_PHONE = ?" );
			count++;
		}
		if( work_phone != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "WORK_PHONE = ?" );
			count++;
		}
		if( address1 != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "ADDRESS1 = ?" );
			count++;
		}
		if( address2 != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "ADDRESS2 = ?" );
			count++;
		}
		if( city != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "CITY = ?" );
			count++;
		}
		if( zip != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "ZIP = ?" );
			count++;
		}
		if( middle_name != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "MIDDLE_NAME = ?" );
			count++;
		}
		if( activation_code != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "ACTIVATION_CODE = ?" );
			count++;
		}
		if( member_since != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "MEMBER_SINCE = ?" );
			count++;
		}
		if( notify != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "NOTIFY = ?" );
			count++;
		}
		if( quote != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "QUOTE = ?" );
			count++;
		}
		if( employer_search != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "EMPLOYER_SEARCH = ?" );
			count++;
		}
		if( relocate != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "RELOCATE = ?" );
			count++;
		}
		if( modify_date != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "MODIFY_DATE = ?" );
			count++;
		}
		if( referral_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "REFERRAL_ID = " + referral_id.intValue() );
			count++;
		}
		if( editor_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "EDITOR_ID = " + editor_id.intValue() );
			count++;
		}
		if( notify_inquiry != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "NOTIFY_INQUIRY = ?" );
			count++;
		}
		if( referral_user_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "REFERRAL_USER_ID = " + referral_user_id.intValue() );
			count++;
		}
		if( language_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "LANGUAGE_ID = " + language_id.intValue() );
			count++;
		}
		if( coder_type_id != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "CODER_TYPE_ID = " + coder_type_id.intValue() );
			count++;
		}
		if( image != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "IMAGE = " + image.intValue() );
			count++;
		}
		if( date_of_birth != null ) {
			if( count > 0 )
				update.append( ", " );
			update.append( "DATE_OF_BIRTH = ?" );
			count++;
		}
		update.append( " WHERE CODER_ID = " + coder_id );
		if( count == 0 )
			return( 0 );
		int	rc = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement( update.toString() );
			int	index = 1;
			if( state_code != null )
				ps.setString( index++, state_code );
			if( country_code != null )
				ps.setString( index++, country_code );
			if( first_name != null )
				ps.setString( index++, first_name );
			if( last_name != null )
				ps.setString( index++, last_name );
			if( home_phone != null )
				ps.setString( index++, home_phone );
			if( work_phone != null )
				ps.setString( index++, work_phone );
			if( address1 != null )
				ps.setString( index++, address1 );
			if( address2 != null )
				ps.setString( index++, address2 );
			if( city != null )
				ps.setString( index++, city );
			if( zip != null )
				ps.setString( index++, zip );
			if( middle_name != null )
				ps.setString( index++, middle_name );
			if( activation_code != null )
				ps.setString( index++, activation_code );
			if( member_since != null )
				ps.setDate( index++, member_since );
			if( notify != null )
				ps.setString( index++, notify );
			if( quote != null )
				ps.setString( index++, quote );
			if( employer_search != null )
				ps.setString( index++, employer_search );
			if( relocate != null )
				ps.setString( index++, relocate );
			if( modify_date != null )
				ps.setDate( index++, modify_date );
			if( notify_inquiry != null )
				ps.setString( index++, notify_inquiry );
			if( date_of_birth != null )
				ps.setDate( index++, date_of_birth );
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

	public String list() throws SQLException {
		Connection	conn = null;
		PreparedStatement	ps = null;
		ResultSet	rs = null;
		Vector	results = new Vector();
		String	query = "SELECT CODER_ID FROM CODER";

		try {
			conn = getConnection();
			ps = conn.prepareStatement( query );
			rs = ps.executeQuery();
			while( rs.next() )
				results.add( new Long( rs.getLong( 1 ) ) );
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

	/**
	 * Return whether or not the specified coder is a student.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, June 17th, 2002
	 */

	public boolean isStudent( Long coderId ) throws SQLException {
		Integer	type = getCoderTypeId( coderId );
		return( type.intValue() == 1 );
	}

	/**
	 * Indicate that the specified coder is a student.
	 * @param coder_id the table primary key
	 * @exception SQLException if a database error occurs
	 * @author Phil Selby, June 17th, 2002
	 */

	public void setIsStudent( Long coderId ) throws SQLException {
		Integer	type = getCoderTypeId( coderId );
		if( type.intValue() != 1 )
			setCoderTypeId( coderId, new Integer( 1 ) );
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
