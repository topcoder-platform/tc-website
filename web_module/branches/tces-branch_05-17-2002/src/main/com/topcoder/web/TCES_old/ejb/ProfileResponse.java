package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileResponseObject;

public interface ProfileResponse extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer response_id, Integer question_id, Integer profile_id, Integer answer_id, String text, Integer whatisthis, Date when ) throws RemoteException, SQLException;
	public void delete( Integer response_id ) throws RemoteException, SQLException;
	public ProfileResponseObject request( int cmd, ProfileResponseObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setQuestionId( Integer response_id, Integer question_id ) throws RemoteException, SQLException;
	public Integer getQuestionId( Integer response_id ) throws RemoteException, SQLException;
	public void setProfileId( Integer response_id, Integer profile_id ) throws RemoteException, SQLException;
	public Integer getProfileId( Integer response_id ) throws RemoteException, SQLException;
	public void setAnswerId( Integer response_id, Integer answer_id ) throws RemoteException, SQLException;
	public Integer getAnswerId( Integer response_id ) throws RemoteException, SQLException;
	public void setText( Integer response_id, String text ) throws RemoteException, SQLException;
	public String getText( Integer response_id ) throws RemoteException, SQLException;
	public void setWhatisthis( Integer response_id, Integer whatisthis ) throws RemoteException, SQLException;
	public Integer getWhatisthis( Integer response_id ) throws RemoteException, SQLException;
	public void setWhen( Integer response_id, Date when ) throws RemoteException, SQLException;
	public Date getWhen( Integer response_id ) throws RemoteException, SQLException;
}
