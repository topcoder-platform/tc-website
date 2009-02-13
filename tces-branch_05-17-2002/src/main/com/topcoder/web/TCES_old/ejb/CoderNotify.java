package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	java.util.Hashtable;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.CoderNotifyObject;

/**
 * This is the remote interface for the CoderNotify class.
 * @author Phil Selby, May 22nd, 2002
 */

public interface CoderNotify extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	/**
	 * Create a new record.
	 * @param coder_id coder_id
	 * @param notify_id notify_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( Long coder_id, Integer notify_id ) throws RemoteException, SQLException;

	/**
	 * Create a new record with a pre-existing database connection.
	 * @param conn an open database connection
	 * @param coder_id coder_id
	 * @param notify_id notify_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void create( java.sql.Connection conn, Long coder_id, Integer notify_id ) throws RemoteException, SQLException;

	/**
	 * Delete a record.
	 * @param coder_id coder_id
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void delete( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Perform a table operation.
	 * @param cmd the operation type
	 * (INSERT, SELECT, UPDATE or DELETE)
	 * @param obj a reference to a wrapper object
	 * encapsulating the table data
	 * @see com.topcoder.web.TCES.ejb.CoderNotifyObject
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public CoderNotifyObject request( int cmd, CoderNotifyObject obj ) throws RemoteException, SQLException;

	/**
	 * List the primary keys of the coder_notify table.
	 * @return a String containing the concatenated keys,
	 * separated by spaces
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public String list() throws RemoteException, SQLException;

	/**
	 * Set the notify_id field in the coder_notify table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @param notify_id the new field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public void setNotifyId( Long coder_id, Integer notify_id ) throws RemoteException, SQLException;

	/**
	 * Get the notify_id field from the coder_notify table corresponding to the given key.
	 * @param coder_id the table primary key
	 * @return the current field value
	 * @exception SQLException if a database error occurs
	 * @exception RemoteException if a system error occurs
	 * @author Phil Selby, May 22nd, 2002
	 */

	public Integer getNotifyId( Long coder_id ) throws RemoteException, SQLException;

	/**
	 * Set (or clear) the competition results notification status of a coder.
	 * @param coderId the coder_id to update
	 * @param value true if notification desired, false if not desired
	 * @author Phil Selby, June 13th, 2001
	 */

	public boolean getSendNextCompetition( Long coderId )
	  throws RemoteException, SQLException;

	/**
	 * Set (or clear) the competition results notification status of a coder.
	 * @param coderId the coder_id to update
	 * @param value true if notification desired, false if not desired
	 * @author Phil Selby, June 13th, 2001
	 */

	public boolean getSendCompetitionResults( Long coderId )
	  throws RemoteException, SQLException;

	/**
	 * Set (or clear) the competition results notification status of a coder.
	 * @param coderId the coder_id to update
	 * @param value true if notification desired, false if not desired
	 * @author Phil Selby, June 13th, 2001
	 */

	public boolean getSendEmploymentOpportunities( Long coderId )
	  throws RemoteException, SQLException;

	/**
	 * Get the member development opportunities notification status of a coder.
	 * @param coderId the coder_id to query
	 * @return true if notification is enabled else false
	 * @author Phil Selby, June 13th, 2001
	 */

	public boolean getSendMemberDevelopmentOpportunities( Long coderId )
	  throws RemoteException, SQLException;

	/**
	 * Get the TopCoder news notification status of a coder.
	 * @param coderId the coder_id to query
	 * @return true if notification is enabled else false
	 * @author Phil Selby, June 13th, 2001
	 */

	public boolean getSendTopCoderNews( Long coderId )
	  throws RemoteException, SQLException;

	/**
	 * Set (or clear) the next competition notification status of a coder.
	 * @param coderId the coder_id to update
	 * @param value true if notification desired, false if not desired
	 * @author Phil Selby, June 13th, 2001
	 */

	public void setSendNextCompetition( Long coderId, boolean value )
	  throws RemoteException, SQLException;

	/**
	 * Set (or clear) the competition results notification status of a coder.
	 * @param coderId the coder_id to update
	 * @param value true if notification desired, false if not desired
	 * @author Phil Selby, June 13th, 2001
	 */

	public void setSendCompetitionResults( Long coderId, boolean value )
	  throws RemoteException, SQLException;

	/**
	 * Set (or clear) the employment opportunities notification status of a coder.
	 * @param coderId the coder_id to update
	 * @param value true if notification desired, false if not desired
	 * @author Phil Selby, June 13th, 2001
	 */

	public void setSendEmploymentOpportunities( Long coderId, boolean value )
	  throws RemoteException, SQLException;

	/**
	 * Set (or clear) the member development opportunities notification status of a coder.
	 * @param coderId the coder_id to update
	 * @param value true if notification desired, false if not desired
	 * @author Phil Selby, June 13th, 2001
	 */

	public void setSendMemberDevelopmentOpportunities( Long coderId, boolean value )
	  throws RemoteException, SQLException;

	/**
	 * Set (or clear) the TopCoder news notification status of a coder.
	 * @param coderId the coder_id to update
	 * @param value true if notification desired, false if not desired
	 * @author Phil Selby, June 13th, 2001
	 */

	public void setSendTopCoderNews( Long coderId, boolean value )
	  throws RemoteException, SQLException;
}
