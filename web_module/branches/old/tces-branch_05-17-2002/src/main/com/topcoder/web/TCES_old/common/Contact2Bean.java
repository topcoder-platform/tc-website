package	com.topcoder.web.TCES.ejb;

import	java.sql.Connection;
import	java.sql.PreparedStatement;
import	java.sql.Statement;
import	java.sql.SQLException;
import	java.sql.ResultSet;
import	java.rmi.RemoteException;
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
import	com.topcoder.web.TCES.ejb.Contact2;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the implementation of the Contact2 class.
 * @see com.topcoder.web.TCES.ejb.Contact
 * @author Phil Selby, June 12th, 2002
 */

public class Contact2Bean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	com.topcoder.web.TCES.common.Coder	coderBean = null;
	com.topcoder.web.TCES.common.CoderNotify	coderNotifyBean = null;
	com.topcoder.web.TCES.common.Country	countryBean = null;
	com.topcoder.web.TCES.common.Editor	editorBean = null;
	com.topcoder.web.TCES.common.Language	languageBean = null;
	com.topcoder.web.TCES.common.State	stateBean = null;
	com.topcoder.web.TCES.common.User	userBean = null;
	Connection	conn = null;

	public void ejbCreate() {
		try {
			Context	context = new InitialContext();
			DataSource	ds = (DataSource)
			  context.lookup( "OLTP" );
			conn = ds.getConnection();
		}
		catch( Exception e ) {
			throw new EJBException( e );
		}
	}

	public void ejbRemove() {
	}

	public String getFirstName( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		return( coderBean.getFirstName( profileId ) );
	}

	public String getLastName( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		return( coderBean.getLastName( profileId ) );
	}

	public String getAddress1( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		return( coderBean.getAddress1( profileId ) );
	}

	public String getAddress2( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		return( coderBean.getAddress2( profileId ) );
	}

	public String getCity( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		return( coderBean.getCity( profileId ) );
	}

	public String getSelectedState( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		return( coderBean.getStateCode( profileId ) );
	}

	public Lookup getStateList()
	  throws RemoteException, SQLException {
		if( stateBean == null )
		  stateBean = new com.topcoder.web.TCES.common.State( conn );
		return( stateBean.listStateCodeStateName() );
	}

	public String getZip( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		return( coderBean.getZip( profileId ) );
	}

	public String getSelectedCountry( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		return( coderBean.getCountryCode( profileId ) );
	}

	public Lookup getCountryList()
	  throws RemoteException, SQLException {
		if( countryBean == null )
		  countryBean = new com.topcoder.web.TCES.common.Country( conn );
		return( countryBean.listCountryCodeCountryName() );
	}

	public String getPhone( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		return( coderBean.getHomePhone( profileId ) );
	}

	public String getHandle( Long profileId )
	  throws RemoteException, SQLException {
		if( userBean == null )
		  userBean = new com.topcoder.web.TCES.common.User( conn );
		return( userBean.getHandle( profileId ) );
	}

	public String getEmail( Long profileId )
	  throws RemoteException, SQLException {
		if( userBean == null )
		  userBean = new com.topcoder.web.TCES.common.User( conn );
		return( userBean.getEmail( profileId ) );
	}

	public String getQuote( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		return( coderBean.getQuote( profileId ) );
	}

	public boolean getSendNextCompetition( Long profileId )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new com.topcoder.web.TCES.common.CoderNotify( conn );
		return( coderNotifyBean.getSendNextCompetition( profileId ) );
	}

	public boolean getSendCompetitionResults( Long profileId )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new com.topcoder.web.TCES.common.CoderNotify( conn );
		return( coderNotifyBean.getSendCompetitionResults( profileId ) );
	}

	public boolean getSendEmploymentOpportunities( Long profileId )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new com.topcoder.web.TCES.common.CoderNotify( conn );
		return( coderNotifyBean.getSendEmploymentOpportunities( profileId ) );
	}

	public boolean getSendMemberDevelopmentOpportunities( Long profileId )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new com.topcoder.web.TCES.common.CoderNotify( conn );
		return( coderNotifyBean.getSendMemberDevelopmentOpportunities( profileId ) );
	}

	public boolean getSendTopCoderNews( Long profileId )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new com.topcoder.web.TCES.common.CoderNotify( conn );
		return( coderNotifyBean.getSendTopCoderNews( profileId ) );
	}

	public Lookup getEditorList()
	  throws RemoteException, SQLException {
		if( editorBean == null )
		  editorBean = new com.topcoder.web.TCES.common.Editor( conn );
		return( editorBean.listEditorIdEditorDesc() );
	}

	public String getSelectedEditor( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		return( coderBean.getEditorId( profileId ).toString() );
	}

	public Lookup getLanguagesList()
	  throws RemoteException, SQLException {
		if( languageBean == null )
		  languageBean = new com.topcoder.web.TCES.common.Language( conn );
		return( languageBean.listLanguageIdLanguageName() );
	}

	public String getSelectedLanguage( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		return( coderBean.getLanguageId( profileId ).toString() );
	}

	public boolean isStudent( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		return( coderBean.isStudent( profileId ) );
	}

	public void setFirstName( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		coderBean.setFirstName( profileId, s );
	}

	public void setLastName( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		coderBean.setLastName( profileId, s );
	}

	public void setAddress1( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		coderBean.setAddress1( profileId, s );
	}

	public void setAddress2( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		coderBean.setAddress2( profileId, s );
	}

	public void setCity( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		coderBean.setCity( profileId, s );
	}

	public void setSelectedState( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		coderBean.setStateCode( profileId, s );
	}

	public void setZip( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		coderBean.setZip( profileId, s );
	}

	public void setSelectedCountry( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		coderBean.setCountryCode( profileId, s );
	}

	public void setPhone( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		coderBean.setHomePhone( profileId, s );
	}

	public void setHandle( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( userBean == null )
		  userBean = new com.topcoder.web.TCES.common.User( conn );
		userBean.setHandle( profileId, s );
	}

	public void setEmail( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( userBean == null )
		  userBean = new com.topcoder.web.TCES.common.User( conn );
		userBean.setEmail( profileId, s );
	}

	public void setQuote( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		coderBean.setQuote( profileId, s );
	}

	public void setSendNextCompetition( Long profileId, boolean b )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new com.topcoder.web.TCES.common.CoderNotify( conn );
		coderNotifyBean.setSendNextCompetition( profileId, b );
	}

	public void setSendCompetitionResults( Long profileId, boolean b )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new com.topcoder.web.TCES.common.CoderNotify( conn );
		coderNotifyBean.setSendCompetitionResults( profileId, b );
	}

	public void setSendEmploymentOpportunities( Long profileId, boolean b )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new com.topcoder.web.TCES.common.CoderNotify( conn );
		coderNotifyBean.setSendEmploymentOpportunities( profileId, b );
	}

	public void setSendMemberDevelopmentOpportunities( Long profileId, boolean b )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new com.topcoder.web.TCES.common.CoderNotify( conn );
		coderNotifyBean.setSendMemberDevelopmentOpportunities( profileId, b );
	}

	public void setSendTopCoderNews( Long profileId, boolean b )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new com.topcoder.web.TCES.common.CoderNotify( conn );
		coderNotifyBean.setSendTopCoderNews( profileId, b );
	}

	public void setSelectedEditor( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		coderBean.setEditorId( profileId, new Integer( s ) );
	}

	public void setSelectedLanguage( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		coderBean.setLanguageId( profileId, new Integer( s ) );
	}

	public void setIsStudent( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		coderBean.setIsStudent( profileId );
	}

	public CoderObject request( int cmd, CoderObject obj )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new com.topcoder.web.TCES.common.Coder( conn );
		return( coderBean.request( cmd, obj ) );
	}

	public CoderNotifyObject request( int cmd, CoderNotifyObject obj )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new com.topcoder.web.TCES.common.CoderNotify( conn );
		return( coderNotifyBean.request( cmd, obj ) );
	}

	public CountryObject request( int cmd, CountryObject obj )
	  throws RemoteException, SQLException {
		if( countryBean == null )
		  countryBean = new com.topcoder.web.TCES.common.Country( conn );
		return( countryBean.request( cmd, obj ) );
	}

	public EditorObject request( int cmd, EditorObject obj )
	  throws RemoteException, SQLException {
		if( editorBean == null )
		  editorBean = new com.topcoder.web.TCES.common.Editor( conn );
		return( editorBean.request( cmd, obj ) );
	}

	public LanguageObject request( int cmd, LanguageObject obj )
	  throws RemoteException, SQLException {
		if( languageBean == null )
		  languageBean = new com.topcoder.web.TCES.common.Language( conn );
		return( languageBean.request( cmd, obj ) );
	}

	public StateObject request( int cmd, StateObject obj )
	  throws RemoteException, SQLException {
		if( stateBean == null )
		  stateBean = new com.topcoder.web.TCES.common.State( conn );
		return( stateBean.request( cmd, obj ) );
	}

	public UserObject request( int cmd, UserObject obj )
	  throws RemoteException, SQLException {
		if( userBean == null )
		  userBean = new com.topcoder.web.TCES.common.User( conn );
		return( userBean.request( cmd, obj ) );
	}


	public void setSessionContext( SessionContext context ) {
		this.context = context;
	}

	public void ejbActivate() {
	}

	public void ejbPassivate() {
	}
}
