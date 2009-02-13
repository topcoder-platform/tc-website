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
import	com.topcoder.web.TCES.ejb.Contact;
import	com.topcoder.web.TCES.common.Lookup;
import	com.topcoder.web.TCES.common.NoRecordFoundException;

/**
 * This is the implementation of the Contact class.
 * @see com.topcoder.web.TCES.ejb.Contact
 * @author Phil Selby, June 12th, 2002
 */

public class ContactBean implements javax.ejb.SessionBean {

	public SessionContext	context = null;
	CoderHome	coderHome = null;
	CoderNotifyHome	coderNotifyHome = null;
	CountryHome	countryHome = null;
	EditorHome	editorHome = null;
	LanguageHome	languageHome = null;
	StateHome	stateHome = null;
	UserHome	userHome = null;

	public void ejbCreate() {
		try {
			Context context = new InitialContext();
			coderHome = (CoderHome) context.lookup(
			  "com.topcoder.web.TCES.ejb.Coder" );
			coderNotifyHome = (CoderNotifyHome) context.lookup(
			  "com.topcoder.web.TCES.ejb.CoderNotify" );
			countryHome = (CountryHome) context.lookup(
			  "com.topcoder.web.TCES.ejb.Country" );
			editorHome = (EditorHome) context.lookup(
			  "com.topcoder.web.TCES.ejb.Editor" );
			languageHome = (LanguageHome) context.lookup(
			  "com.topcoder.web.TCES.ejb.Language" );
			stateHome = (StateHome) context.lookup(
			  "com.topcoder.web.TCES.ejb.State" );
			userHome = (UserHome) context.lookup(
			  "com.topcoder.web.TCES.ejb.User" );
		}
		catch( NamingException e ) {
			throw new EJBException( e );
		}
	}

	public void ejbRemove() {
		coderHome = null;
		coderNotifyHome = null;
		countryHome = null;
		editorHome = null;
		languageHome = null;
		stateHome = null;
		userHome = null;
	}

	public String getFirstName( Long profileId )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			return( coderBean.getFirstName( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public String getLastName( Long profileId )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			return( coderBean.getLastName( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public String getAddress1( Long profileId )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			return( coderBean.getAddress1( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public String getAddress2( Long profileId )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			return( coderBean.getAddress2( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public String getCity( Long profileId )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			return( coderBean.getCity( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public String getSelectedState( Long profileId )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			return( coderBean.getStateCode( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public Lookup getStateList()
	  throws RemoteException, SQLException {
		State	stateBean = null;

		try {
			stateBean = stateHome.create();
			return( stateBean.listStateCodeStateName() );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public String getZip( Long profileId )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			return( coderBean.getZip( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public String getSelectedCountry( Long profileId )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			return( coderBean.getCountryCode( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public Lookup getCountryList()
	  throws RemoteException, SQLException {
		Country	countryBean = null;

		try {
			countryBean = countryHome.create();
			return( countryBean.listCountryCodeCountryName() );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public String getPhone( Long profileId )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			return( coderBean.getHomePhone( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public String getHandle( Long profileId )
	  throws RemoteException, SQLException {
		User	userBean = null;

		try {
			userBean = userHome.create();
			return( userBean.getHandle( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public String getEmail( Long profileId )
	  throws RemoteException, SQLException {
		User	userBean = null;

		try {
			userBean = userHome.create();
			return( userBean.getEmail( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public String getQuote( Long profileId )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			return( coderBean.getQuote( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public boolean getSendNextCompetition( Long profileId )
	  throws RemoteException, SQLException {
		CoderNotify	coderNotifyBean = null;

		try {
			coderNotifyBean = coderNotifyHome.create();
			return( coderNotifyBean.getSendNextCompetition( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public boolean getSendCompetitionResults( Long profileId )
	  throws RemoteException, SQLException {
		CoderNotify	coderNotifyBean = null;

		try {
			coderNotifyBean = coderNotifyHome.create();
			return( coderNotifyBean.getSendCompetitionResults( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public boolean getSendEmploymentOpportunities( Long profileId )
	  throws RemoteException, SQLException {
		CoderNotify	coderNotifyBean = null;

		try {
			coderNotifyBean = coderNotifyHome.create();
			return( coderNotifyBean.getSendEmploymentOpportunities( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public boolean getSendMemberDevelopmentOpportunities( Long profileId )
	  throws RemoteException, SQLException {
		CoderNotify	coderNotifyBean = null;

		try {
			coderNotifyBean = coderNotifyHome.create();
			return( coderNotifyBean.getSendMemberDevelopmentOpportunities( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public boolean getSendTopCoderNews( Long profileId )
	  throws RemoteException, SQLException {
		CoderNotify	coderNotifyBean = null;

		try {
			coderNotifyBean = coderNotifyHome.create();
			return( coderNotifyBean.getSendTopCoderNews( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public Lookup getEditorList()
	  throws RemoteException, SQLException {
		Editor	editorBean = null;

		try {
			editorBean = editorHome.create();
			return( editorBean.listEditorIdEditorDesc() );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public String getSelectedEditor( Long profileId )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			return( coderBean.getEditorId( profileId ).toString() );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public Lookup getLanguagesList()
	  throws RemoteException, SQLException {
		Language	languageBean = null;

		try {
			languageBean = languageHome.create();
			return( languageBean.listLanguageIdLanguageName() );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public String getSelectedLanguage( Long profileId )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			return( coderBean.getLanguageId( profileId ).toString() );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public boolean isStudent( Long profileId )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			return( coderBean.isStudent( profileId ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setFirstName( Long profileId, String s )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			coderBean.setFirstName( profileId, s );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setLastName( Long profileId, String s )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			coderBean.setLastName( profileId, s );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setAddress1( Long profileId, String s )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			coderBean.setAddress1( profileId, s );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setAddress2( Long profileId, String s )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			coderBean.setAddress2( profileId, s );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setCity( Long profileId, String s )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			coderBean.setCity( profileId, s );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setSelectedState( Long profileId, String s )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			coderBean.setStateCode( profileId, s );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setZip( Long profileId, String s )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			coderBean.setZip( profileId, s );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setSelectedCountry( Long profileId, String s )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			coderBean.setCountryCode( profileId, s );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setPhone( Long profileId, String s )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			coderBean.setHomePhone( profileId, s );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setHandle( Long profileId, String s )
	  throws RemoteException, SQLException {
		User	userBean = null;

		try {
			userBean = userHome.create();
			userBean.setHandle( profileId, s );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setEmail( Long profileId, String s )
	  throws RemoteException, SQLException {
		User	userBean = null;

		try {
			userBean = userHome.create();
			userBean.setEmail( profileId, s );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setQuote( Long profileId, String s )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			coderBean.setQuote( profileId, s );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setSendNextCompetition( Long profileId, boolean b )
	  throws RemoteException, SQLException {
		CoderNotify	coderNotifyBean = null;

		try {
			coderNotifyBean = coderNotifyHome.create();
			coderNotifyBean.setSendNextCompetition( profileId, b );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setSendCompetitionResults( Long profileId, boolean b )
	  throws RemoteException, SQLException {
		CoderNotify	coderNotifyBean = null;

		try {
			coderNotifyBean = coderNotifyHome.create();
			coderNotifyBean.setSendCompetitionResults( profileId, b );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setSendEmploymentOpportunities( Long profileId, boolean b )
	  throws RemoteException, SQLException {
		CoderNotify	coderNotifyBean = null;

		try {
			coderNotifyBean = coderNotifyHome.create();
			coderNotifyBean.setSendEmploymentOpportunities( profileId, b );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setSendMemberDevelopmentOpportunities( Long profileId, boolean b )
	  throws RemoteException, SQLException {
		CoderNotify	coderNotifyBean = null;

		try {
			coderNotifyBean = coderNotifyHome.create();
			coderNotifyBean.setSendMemberDevelopmentOpportunities( profileId, b );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setSendTopCoderNews( Long profileId, boolean b )
	  throws RemoteException, SQLException {
		CoderNotify	coderNotifyBean = null;

		try {
			coderNotifyBean = coderNotifyHome.create();
			coderNotifyBean.setSendTopCoderNews( profileId, b );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setSelectedEditor( Long profileId, String s )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			coderBean.setEditorId( profileId, new Integer( s ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setSelectedLanguage( Long profileId, String s )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			coderBean.setLanguageId( profileId, new Integer( s ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public void setIsStudent( Long profileId )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			coderBean.setIsStudent( profileId );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public CoderObject request( int cmd, CoderObject obj )
	  throws RemoteException, SQLException {
		Coder	coderBean = null;

		try {
			coderBean = coderHome.create();
			return( coderBean.request( cmd, obj ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public CoderNotifyObject request( int cmd, CoderNotifyObject obj )
	  throws RemoteException, SQLException {
		CoderNotify	coderNotifyBean = null;

		try {
			coderNotifyBean = coderNotifyHome.create();
			return( coderNotifyBean.request( cmd, obj ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public CountryObject request( int cmd, CountryObject obj )
	  throws RemoteException, SQLException {
		Country	countryBean = null;

		try {
			countryBean = countryHome.create();
			return( countryBean.request( cmd, obj ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public EditorObject request( int cmd, EditorObject obj )
	  throws RemoteException, SQLException {
		Editor	editorBean = null;

		try {
			editorBean = editorHome.create();
			return( editorBean.request( cmd, obj ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public LanguageObject request( int cmd, LanguageObject obj )
	  throws RemoteException, SQLException {
		Language	languageBean = null;

		try {
			languageBean = languageHome.create();
			return( languageBean.request( cmd, obj ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public StateObject request( int cmd, StateObject obj )
	  throws RemoteException, SQLException {
		State	stateBean = null;

		try {
			stateBean = stateHome.create();
			return( stateBean.request( cmd, obj ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}

	public UserObject request( int cmd, UserObject obj )
	  throws RemoteException, SQLException {
		User	userBean = null;

		try {
			userBean = userHome.create();
			return( userBean.request( cmd, obj ) );
		}
		catch( CreateException e ) {
			throw new EJBException( e );
		}
	}


	public void setSessionContext( SessionContext context ) {
		this.context = context;
	}

	public void ejbActivate() {
	}

	public void ejbPassivate() {
	}
}
