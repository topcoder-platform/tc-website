package	com.topcoder.web.TCES.ejb;

import	java.sql.SQLException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.common.*;

/**
 * This is the remote interface for the Contact2 class.
 * @author Phil Selby, June 12th, 2002
 */

public interface Contact2 extends javax.ejb.EJBObject {
	String getFirstName( Long profileId )
	  throws RemoteException, SQLException;
	String getLastName( Long profileId )
	  throws RemoteException, SQLException;
	String getAddress1( Long profileId )
	  throws RemoteException, SQLException;
	String getAddress2( Long profileId )
	  throws RemoteException, SQLException;
	String getCity( Long profileId )
	  throws RemoteException, SQLException;
	String getSelectedState( Long profileId )
	  throws RemoteException, SQLException;
	Lookup getStateList()
	  throws RemoteException, SQLException;
	String getZip( Long profileId )
	  throws RemoteException, SQLException;
	String getSelectedCountry( Long profileId )
	  throws RemoteException, SQLException;
	Lookup getCountryList()
	  throws RemoteException, SQLException;
	String getPhone( Long profileId )
	  throws RemoteException, SQLException;
	String getHandle( Long profileId )
	  throws RemoteException, SQLException;
	String getEmail( Long profileId )
	  throws RemoteException, SQLException;
	String getQuote( Long profileId )
	  throws RemoteException, SQLException;
	boolean getSendNextCompetition( Long profileId )
	  throws RemoteException, SQLException;
	boolean getSendCompetitionResults( Long profileId )
	  throws RemoteException, SQLException;
	boolean getSendEmploymentOpportunities( Long profileId )
	  throws RemoteException, SQLException;
	boolean getSendMemberDevelopmentOpportunities( Long profileId )
	  throws RemoteException, SQLException;
	boolean getSendTopCoderNews( Long profileId )
	  throws RemoteException, SQLException;
	Lookup getEditorList()
	  throws RemoteException, SQLException;
	String getSelectedEditor( Long profileId )
	  throws RemoteException, SQLException;
	Lookup getLanguagesList()
	  throws RemoteException, SQLException;
	String getSelectedLanguage( Long profileId )
	  throws RemoteException, SQLException;
	boolean isStudent( Long profileId )
	  throws RemoteException, SQLException;
	void setFirstName( Long profileId, String s )
	  throws RemoteException, SQLException;
	void setLastName( Long profileId, String s )
	  throws RemoteException, SQLException;
	void setAddress1( Long profileId, String s )
	  throws RemoteException, SQLException;
	void setAddress2( Long profileId, String s )
	  throws RemoteException, SQLException;
	void setCity( Long profileId, String s )
	  throws RemoteException, SQLException;
	void setSelectedState( Long profileId, String s )
	  throws RemoteException, SQLException;
	void setZip( Long profileId, String s )
	  throws RemoteException, SQLException;
	void setSelectedCountry( Long profileId, String s )
	  throws RemoteException, SQLException;
	void setPhone( Long profileId, String s )
	  throws RemoteException, SQLException;
	void setHandle( Long profileId, String s )
	  throws RemoteException, SQLException;
	void setEmail( Long profileId, String s )
	  throws RemoteException, SQLException;
	void setQuote( Long profileId, String s )
	  throws RemoteException, SQLException;
	void setSendNextCompetition( Long profileId, boolean b )
	  throws RemoteException, SQLException;
	void setSendCompetitionResults( Long profileId, boolean b )
	  throws RemoteException, SQLException;
	void setSendEmploymentOpportunities( Long profileId, boolean b )
	  throws RemoteException, SQLException;
	void setSendMemberDevelopmentOpportunities( Long profileId, boolean b )
	  throws RemoteException, SQLException;
	void setSendTopCoderNews( Long profileId, boolean b )
	  throws RemoteException, SQLException;
	void setSelectedEditor( Long profileId, String s )
	  throws RemoteException, SQLException;
	void setSelectedLanguage( Long profileId, String s )
	  throws RemoteException, SQLException;
	void setIsStudent( Long profileId )
	  throws RemoteException, SQLException;
	CoderObject request( int cmd, CoderObject obj )
	  throws RemoteException, SQLException;
	CoderNotifyObject request( int cmd, CoderNotifyObject obj )
	  throws RemoteException, SQLException;
	CountryObject request( int cmd, CountryObject obj )
	  throws RemoteException, SQLException;
	EditorObject request( int cmd, EditorObject obj )
	  throws RemoteException, SQLException;
	LanguageObject request( int cmd, LanguageObject obj )
	  throws RemoteException, SQLException;
	StateObject request( int cmd, StateObject obj )
	  throws RemoteException, SQLException;
	UserObject request( int cmd, UserObject obj )
	  throws RemoteException, SQLException;
}
