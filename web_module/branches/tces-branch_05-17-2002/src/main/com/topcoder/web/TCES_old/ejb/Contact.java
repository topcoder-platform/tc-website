package	com.topcoder.web.TCES.ejb;

import	java.sql.SQLException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.common.Lookup;
import	com.topcoder.web.TCES.common.RecordNotFoundException;

/**
 * This is the remote interface for the Contact class.
 * @author Phil Selby, June 12th, 2002
 */

public interface Contact extends javax.ejb.EJBObject {
	public String getFirstName( Long profileId )
	  throws RemoteException, SQLException;
	public String getLastName( Long profileId )
	  throws RemoteException, SQLException;
	public String getAddress1( Long profileId )
	  throws RemoteException, SQLException;
	public String getAddress2( Long profileId )
	  throws RemoteException, SQLException;
	public String getCity( Long profileId )
	  throws RemoteException, SQLException;
	public String getSelectedState( Long profileId )
	  throws RemoteException, SQLException;
	public Lookup getStateList()
	  throws RemoteException, SQLException;
	public String getZip( Long profileId )
	  throws RemoteException, SQLException;
	public String getSelectedCountry( Long profileId )
	  throws RemoteException, SQLException;
	public Lookup getCountryList()
	  throws RemoteException, SQLException;
	public String getPhone( Long profileId )
	  throws RemoteException, SQLException;
	public String getHandle( Long profileId )
	  throws RemoteException, SQLException;
	public String getEmail( Long profileId )
	  throws RemoteException, SQLException;
	public String getQuote( Long profileId )
	  throws RemoteException, SQLException;
	public boolean getSendNextCompetition( Long profileId )
	  throws RemoteException, SQLException;
	public boolean getSendCompetitionResults( Long profileId )
	  throws RemoteException, SQLException;
	public boolean getSendEmploymentOpportunities( Long profileId )
	  throws RemoteException, SQLException;
	public boolean getSendMemberDevelopmentOpportunities( Long profileId )
	  throws RemoteException, SQLException;
	public boolean getSendTopCoderNews( Long profileId )
	  throws RemoteException, SQLException;
	public Lookup getEditorList()
	  throws RemoteException, SQLException;
	public String getSelectedEditor( Long profileId )
	  throws RemoteException, SQLException;
	public Lookup getLanguagesList()
	  throws RemoteException, SQLException;
	public String getSelectedLanguage( Long profileId )
	  throws RemoteException, SQLException;
	public boolean isStudent( Long profileId )
	  throws RemoteException, SQLException;
	public void setFirstName( Long profileId, String s )
	  throws RemoteException, SQLException;
	public void setLastName( Long profileId, String s )
	  throws RemoteException, SQLException;
	public void setAddress1( Long profileId, String s )
	  throws RemoteException, SQLException;
	public void setAddress2( Long profileId, String s )
	  throws RemoteException, SQLException;
	public void setCity( Long profileId, String s )
	  throws RemoteException, SQLException;
	public void setSelectedState( Long profileId, String s )
	  throws RemoteException, SQLException;
	public void setZip( Long profileId, String s )
	  throws RemoteException, SQLException;
	public void setSelectedCountry( Long profileId, String s )
	  throws RemoteException, SQLException;
	public void setPhone( Long profileId, String s )
	  throws RemoteException, SQLException;
	public void setHandle( Long profileId, String s )
	  throws RemoteException, SQLException;
	public void setEmail( Long profileId, String s )
	  throws RemoteException, SQLException;
	public void setQuote( Long profileId, String s )
	  throws RemoteException, SQLException;
	public void setSendNextCompetition( Long profileId, boolean b )
	  throws RemoteException, SQLException;
	public void setSendCompetitionResults( Long profileId, boolean b )
	  throws RemoteException, SQLException;
	public void setSendEmploymentOpportunities( Long profileId, boolean b )
	  throws RemoteException, SQLException;
	public void setSendMemberDevelopmentOpportunities( Long profileId, boolean b )
	  throws RemoteException, SQLException;
	public void setSendTopCoderNews( Long profileId, boolean b )
	  throws RemoteException, SQLException;
	public void setSelectedEditor( Long profileId, String s )
	  throws RemoteException, SQLException;
	public void setSelectedLanguage( Long profileId, String s )
	  throws RemoteException, SQLException;
	public void setIsStudent( Long profileId )
	  throws RemoteException, SQLException;
}
