package	com.topcoder.web.TCES.ejb;

import	java.sql.SQLException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.common.Lookup;
import	com.topcoder.web.TCES.common.NoRecordFoundException;

/**
 * This is the remote interface for the Contact class.
 * @author Phil Selby, June 12th, 2002
 */

public interface Contact extends javax.ejb.EJBObject {
	/**
	 * Maps to the getFirstName of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	String getFirstName( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getLastName of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	String getLastName( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getAddress1 of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	String getAddress1( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getAddress2 of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	String getAddress2( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getCity of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	String getCity( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getStateCode of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	String getSelectedState( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the listStateCodeStateName of the State class.
	 * @see com.topcoder.web.TCES.ejb.State
	 */

	Lookup getStateList()
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getZip of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	String getZip( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getCountryCode of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	String getSelectedCountry( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the listCountryCodeCountryName of the Country class.
	 * @see com.topcoder.web.TCES.ejb.Country
	 */

	Lookup getCountryList()
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getHomePhone of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	String getPhone( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getHandle of the User class.
	 * @see com.topcoder.web.TCES.ejb.User
	 */

	String getHandle( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getEmail of the User class.
	 * @see com.topcoder.web.TCES.ejb.User
	 */

	String getEmail( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getQuote of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	String getQuote( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getSendNextCompetition of the CoderNotify class.
	 * @see com.topcoder.web.TCES.ejb.CoderNotify
	 */

	boolean getSendNextCompetition( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getSendCompetitionResults of the CoderNotify class.
	 * @see com.topcoder.web.TCES.ejb.CoderNotify
	 */

	boolean getSendCompetitionResults( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getSendEmploymentOpportunities of the CoderNotify class.
	 * @see com.topcoder.web.TCES.ejb.CoderNotify
	 */

	boolean getSendEmploymentOpportunities( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getSendMemberDevelopmentOpportunities of the CoderNotify class.
	 * @see com.topcoder.web.TCES.ejb.CoderNotify
	 */

	boolean getSendMemberDevelopmentOpportunities( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getSendTopCoderNews of the CoderNotify class.
	 * @see com.topcoder.web.TCES.ejb.CoderNotify
	 */

	boolean getSendTopCoderNews( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the listEditorIdEditorDesc of the Editor class.
	 * @see com.topcoder.web.TCES.ejb.Editor
	 */

	Lookup getEditorList()
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getEditorId of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	String getSelectedEditor( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the listLanguageIdLanguageName of the Language class.
	 * @see com.topcoder.web.TCES.ejb.Language
	 */

	Lookup getLanguagesList()
	  throws RemoteException, SQLException;

	/**
	 * Maps to the getLanguageId of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	String getSelectedLanguage( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the isStudent of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	boolean isStudent( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setFirstName of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	void setFirstName( Long profileId, String s )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setLastName of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	void setLastName( Long profileId, String s )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setAddress1 of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	void setAddress1( Long profileId, String s )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setAddress2 of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	void setAddress2( Long profileId, String s )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setCity of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	void setCity( Long profileId, String s )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setStateCode of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	void setSelectedState( Long profileId, String s )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setZip of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	void setZip( Long profileId, String s )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setCountryCode of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	void setSelectedCountry( Long profileId, String s )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setHomePhone of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	void setPhone( Long profileId, String s )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setHandle of the User class.
	 * @see com.topcoder.web.TCES.ejb.User
	 */

	void setHandle( Long profileId, String s )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setEmail of the User class.
	 * @see com.topcoder.web.TCES.ejb.User
	 */

	void setEmail( Long profileId, String s )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setQuote of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	void setQuote( Long profileId, String s )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setSendNextCompetition of the CoderNotify class.
	 * @see com.topcoder.web.TCES.ejb.CoderNotify
	 */

	void setSendNextCompetition( Long profileId, boolean b )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setSendCompetitionResults of the CoderNotify class.
	 * @see com.topcoder.web.TCES.ejb.CoderNotify
	 */

	void setSendCompetitionResults( Long profileId, boolean b )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setSendEmploymentOpportunities of the CoderNotify class.
	 * @see com.topcoder.web.TCES.ejb.CoderNotify
	 */

	void setSendEmploymentOpportunities( Long profileId, boolean b )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setSendMemberDevelopmentOpportunities of the CoderNotify class.
	 * @see com.topcoder.web.TCES.ejb.CoderNotify
	 */

	void setSendMemberDevelopmentOpportunities( Long profileId, boolean b )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setSendTopCoderNews of the CoderNotify class.
	 * @see com.topcoder.web.TCES.ejb.CoderNotify
	 */

	void setSendTopCoderNews( Long profileId, boolean b )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setEditorId of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	void setSelectedEditor( Long profileId, String s )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setLanguageId of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	void setSelectedLanguage( Long profileId, String s )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the setIsStudent of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	void setIsStudent( Long profileId )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the request of the Coder class.
	 * @see com.topcoder.web.TCES.ejb.Coder
	 */

	CoderObject request( int cmd, CoderObject obj )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the request of the CoderNotify class.
	 * @see com.topcoder.web.TCES.ejb.CoderNotify
	 */

	CoderNotifyObject request( int cmd, CoderNotifyObject obj )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the request of the Country class.
	 * @see com.topcoder.web.TCES.ejb.Country
	 */

	CountryObject request( int cmd, CountryObject obj )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the request of the Editor class.
	 * @see com.topcoder.web.TCES.ejb.Editor
	 */

	EditorObject request( int cmd, EditorObject obj )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the request of the Language class.
	 * @see com.topcoder.web.TCES.ejb.Language
	 */

	LanguageObject request( int cmd, LanguageObject obj )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the request of the State class.
	 * @see com.topcoder.web.TCES.ejb.State
	 */

	StateObject request( int cmd, StateObject obj )
	  throws RemoteException, SQLException;

	/**
	 * Maps to the request of the User class.
	 * @see com.topcoder.web.TCES.ejb.User
	 */

	UserObject request( int cmd, UserObject obj )
	  throws RemoteException, SQLException;

}
