package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefJobTypeObject;

public interface PrefJobType extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer profile_id, Integer job_type_id ) throws RemoteException, SQLException;
	public void delete( Integer profile_id ) throws RemoteException, SQLException;
	public PrefJobTypeObject request( int cmd, PrefJobTypeObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public String findByJobTypeId( Integer job_type_id ) throws RemoteException, SQLException;
	public void setJobTypeId( Integer profile_id, Integer job_type_id ) throws RemoteException, SQLException;
	public Integer getJobTypeId( Integer profile_id ) throws RemoteException, SQLException;
}
