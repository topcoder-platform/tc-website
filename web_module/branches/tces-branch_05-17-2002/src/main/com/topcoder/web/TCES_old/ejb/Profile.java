package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileObject;

public interface Profile extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer profile_id, Integer coder_id, Integer status_id ) throws RemoteException, SQLException;
	public void delete( Integer profile_id ) throws RemoteException, SQLException;
	public ProfileObject request( int cmd, ProfileObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setCoderId( Integer profile_id, Integer coder_id ) throws RemoteException, SQLException;
	public Integer getCoderId( Integer profile_id ) throws RemoteException, SQLException;
	public void setStatusId( Integer profile_id, Integer status_id ) throws RemoteException, SQLException;
	public Integer getStatusId( Integer profile_id ) throws RemoteException, SQLException;
}
