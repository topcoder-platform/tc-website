package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefJobRoleObject;

public interface PrefJobRole extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer profile_id, Integer job_role_id ) throws RemoteException, SQLException;
	public void delete( Integer profile_id ) throws RemoteException, SQLException;
	public PrefJobRoleObject request( int cmd, PrefJobRoleObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public String findByJobRoleId( Integer job_role_id ) throws RemoteException, SQLException;
	public void setJobRoleId( Integer profile_id, Integer job_role_id ) throws RemoteException, SQLException;
	public Integer getJobRoleId( Integer profile_id ) throws RemoteException, SQLException;
}
