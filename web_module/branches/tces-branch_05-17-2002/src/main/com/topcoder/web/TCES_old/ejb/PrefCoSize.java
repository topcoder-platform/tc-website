package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefCoSizeObject;

public interface PrefCoSize extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer profile_id, Integer co_size_id ) throws RemoteException, SQLException;
	public void delete( Integer profile_id ) throws RemoteException, SQLException;
	public PrefCoSizeObject request( int cmd, PrefCoSizeObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public String findByCoSizeId( Integer co_size_id ) throws RemoteException, SQLException;
	public void setCoSizeId( Integer profile_id, Integer co_size_id ) throws RemoteException, SQLException;
	public Integer getCoSizeId( Integer profile_id ) throws RemoteException, SQLException;
}
