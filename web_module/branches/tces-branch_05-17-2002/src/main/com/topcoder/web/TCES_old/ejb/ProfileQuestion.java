package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileQuestionObject;

public interface ProfileQuestion extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer question_id, String text, Integer question_type, Integer question_style ) throws RemoteException, SQLException;
	public void delete( Integer question_id ) throws RemoteException, SQLException;
	public ProfileQuestionObject request( int cmd, ProfileQuestionObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setText( Integer question_id, String text ) throws RemoteException, SQLException;
	public String getText( Integer question_id ) throws RemoteException, SQLException;
	public void setQuestionType( Integer question_id, Integer question_type ) throws RemoteException, SQLException;
	public Integer getQuestionType( Integer question_id ) throws RemoteException, SQLException;
	public void setQuestionStyle( Integer question_id, Integer question_style ) throws RemoteException, SQLException;
	public Integer getQuestionStyle( Integer question_id ) throws RemoteException, SQLException;
}
