package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.SkillLevelObject;

public interface SkillLevel extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer skill_level_id, String description ) throws RemoteException, SQLException;
	public void delete( Integer skill_level_id ) throws RemoteException, SQLException;
	public SkillLevelObject request( int cmd, SkillLevelObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setDescription( Integer skill_level_id, String description ) throws RemoteException, SQLException;
	public String getDescription( Integer skill_level_id ) throws RemoteException, SQLException;
}
