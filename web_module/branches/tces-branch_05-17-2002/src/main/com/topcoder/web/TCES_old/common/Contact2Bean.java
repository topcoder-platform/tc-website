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
	common.Coder	coderBean = null;
	common.CoderNotify	coderNotifyBean = null;
	common.Country	countryBean = null;
	common.Editor	editorBean = null;
	common.Language	languageBean = null;
	common.State	stateBean = null;
	common.User	userBean = null;

	public void ejbCreate() {
	}

	public void ejbRemove() {
	}

	public String getFirstName( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		return( coderBean.getFirstName( profileId ) );
	}

	public String getLastName( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		return( coderBean.getLastName( profileId ) );
	}

	public String getAddress1( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		return( coderBean.getAddress1( profileId ) );
	}

	public String getAddress2( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		return( coderBean.getAddress2( profileId ) );
	}

	public String getCity( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		return( coderBean.getCity( profileId ) );
	}

	public String getSelectedState( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		return( coderBean.getStateCode( profileId ) );
	}

	public Lookup getStateList()
	  throws RemoteException, SQLException {
		if( stateBean == null )
		  stateBean = new common.State();
		return( stateBean.listStateCodeStateName() );
	}

	public String getZip( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		return( coderBean.getZip( profileId ) );
	}

	public String getSelectedCountry( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		return( coderBean.getCountryCode( profileId ) );
	}

	public Lookup getCountryList()
	  throws RemoteException, SQLException {
		if( countryBean == null )
		  countryBean = new common.Country();
		return( countryBean.listCountryCodeCountryName() );
	}

	public String getPhone( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		return( coderBean.getHomePhone( profileId ) );
	}

	public String getHandle( Long profileId )
	  throws RemoteException, SQLException {
		if( userBean == null )
		  userBean = new common.User();
		return( userBean.getHandle( profileId ) );
	}

	public String getEmail( Long profileId )
	  throws RemoteException, SQLException {
		if( userBean == null )
		  userBean = new common.User();
		return( userBean.getEmail( profileId ) );
	}

	public String getQuote( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		return( coderBean.getQuote( profileId ) );
	}

	public boolean getSendNextCompetition( Long profileId )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new common.CoderNotify();
		return( coderNotifyBean.getSendNextCompetition( profileId ) );
	}

	public boolean getSendCompetitionResults( Long profileId )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new common.CoderNotify();
		return( coderNotifyBean.getSendCompetitionResults( profileId ) );
	}

	public boolean getSendEmploymentOpportunities( Long profileId )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new common.CoderNotify();
		return( coderNotifyBean.getSendEmploymentOpportunities( profileId ) );
	}

	public boolean getSendMemberDevelopmentOpportunities( Long profileId )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new common.CoderNotify();
		return( coderNotifyBean.getSendMemberDevelopmentOpportunities( profileId ) );
	}

	public boolean getSendTopCoderNews( Long profileId )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new common.CoderNotify();
		return( coderNotifyBean.getSendTopCoderNews( profileId ) );
	}

	public Lookup getEditorList()
	  throws RemoteException, SQLException {
		if( editorBean == null )
		  editorBean = new common.Editor();
		return( editorBean.listEditorIdEditorDesc() );
	}

	public String getSelectedEditor( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		return( coderBean.getEditorId( profileId ).toString() );
	}

	public Lookup getLanguagesList()
	  throws RemoteException, SQLException {
		if( languageBean == null )
		  languageBean = new common.Language();
		return( languageBean.listLanguageIdLanguageName() );
	}

	public String getSelectedLanguage( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		return( coderBean.getLanguageId( profileId ).toString() );
	}

	public boolean isStudent( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		return( coderBean.isStudent( profileId ) );
	}

	public void setFirstName( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		coderBean.setFirstName( profileId, s );
	}

	public void setLastName( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		coderBean.setLastName( profileId, s );
	}

	public void setAddress1( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		coderBean.setAddress1( profileId, s );
	}

	public void setAddress2( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		coderBean.setAddress2( profileId, s );
	}

	public void setCity( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		coderBean.setCity( profileId, s );
	}

	public void setSelectedState( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		coderBean.setStateCode( profileId, s );
	}

	public void setZip( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		coderBean.setZip( profileId, s );
	}

	public void setSelectedCountry( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		coderBean.setCountryCode( profileId, s );
	}

	public void setPhone( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		coderBean.setHomePhone( profileId, s );
	}

	public void setHandle( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( userBean == null )
		  userBean = new common.User();
		userBean.setHandle( profileId, s );
	}

	public void setEmail( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( userBean == null )
		  userBean = new common.User();
		userBean.setEmail( profileId, s );
	}

	public void setQuote( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		coderBean.setQuote( profileId, s );
	}

	public void setSendNextCompetition( Long profileId, boolean b )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new common.CoderNotify();
		coderNotifyBean.setSendNextCompetition( profileId, b );
	}

	public void setSendCompetitionResults( Long profileId, boolean b )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new common.CoderNotify();
		coderNotifyBean.setSendCompetitionResults( profileId, b );
	}

	public void setSendEmploymentOpportunities( Long profileId, boolean b )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new common.CoderNotify();
		coderNotifyBean.setSendEmploymentOpportunities( profileId, b );
	}

	public void setSendMemberDevelopmentOpportunities( Long profileId, boolean b )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new common.CoderNotify();
		coderNotifyBean.setSendMemberDevelopmentOpportunities( profileId, b );
	}

	public void setSendTopCoderNews( Long profileId, boolean b )
	  throws RemoteException, SQLException {
		if( coderNotifyBean == null )
		  coderNotifyBean = new common.CoderNotify();
		coderNotifyBean.setSendTopCoderNews( profileId, b );
	}

	public void setSelectedEditor( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		coderBean.setEditorId( profileId, new Integer( s ) );
	}

	public void setSelectedLanguage( Long profileId, String s )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		coderBean.setLanguageId( profileId, new Integer( s ) );
	}

	public void setIsStudent( Long profileId )
	  throws RemoteException, SQLException {
		if( coderBean == null )
		  coderBean = new common.Coder();
		coderBean.setIsStudent( profileId );
	}


	public void setSessionContext( SessionContext context ) {
		this.context = context;
	}

	public void ejbActivate() {
	}

	public void ejbPassivate() {
	}
}
