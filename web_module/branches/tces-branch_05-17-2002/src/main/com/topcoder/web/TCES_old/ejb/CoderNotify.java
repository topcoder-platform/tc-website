package	com.topcoder.web.TCES.ejb;

import	java.sql.SQLException;
import	java.rmi.RemoteException;

/**
 * This is the remote interface for the CoderNotify class.
 * @author Phil Selby, June 12th, 2002
 */

public interface CoderNotify extends javax.ejb.EJBObject {
	public boolean getSendNextCompetition( long coder_id )
	  throws RemoteException, SQLException;
	public boolean getSendCompetitionResults( long coder_id )
	  throws RemoteException, SQLException;
	public boolean getSendEmploymentOpportunities( long coder_id )
	  throws RemoteException, SQLException;
	public boolean getSendMemberDevelopmentOpportunities( long coder_id )
	  throws RemoteException, SQLException;
	public boolean getSendTopCoderNews( long coder_id )
	  throws RemoteException, SQLException;
	public void setSendNextCompetition( long coder_id, boolean value )
	  throws RemoteException, SQLException;
	public void setSendCompetitionResults( long coder_id, boolean value )
	  throws RemoteException, SQLException;
	public void setSendEmploymentOpportunities( long coder_id, boolean value )
	  throws RemoteException, SQLException;
	public void setSendMemberDevelopmentOpportunities( long coder_id, boolean value )
	  throws RemoteException, SQLException;
	public void setSendTopCoderNews( long coder_id, boolean value )
	  throws RemoteException, SQLException;
}
