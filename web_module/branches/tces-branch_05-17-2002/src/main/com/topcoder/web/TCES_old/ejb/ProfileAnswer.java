package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileAnswerObject;

public interface ProfileAnswer extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer answer_id, Integer question_id, String text ) throws RemoteException, SQLException;
	public void delete( Integer answer_id ) throws RemoteException, SQLException;
	public ProfileAnswerObject request( int cmd, ProfileAnswerObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setQuestionId( Integer answer_id, Integer question_id ) throws RemoteException, SQLException;
	public Integer getQuestionId( Integer answer_id ) throws RemoteException, SQLException;
	public void setText( Integer answer_id, String text ) throws RemoteException, SQLException;
	public String getText( Integer answer_id ) throws RemoteException, SQLException;
}
