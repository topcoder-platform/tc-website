package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.CoSizeObject;

public interface CoSize extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer co_size_id, String description ) throws RemoteException, SQLException;
	public void delete( Integer co_size_id ) throws RemoteException, SQLException;
	public CoSizeObject request( int cmd, CoSizeObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setDescription( Integer co_size_id, String description ) throws RemoteException, SQLException;
	public String getDescription( Integer co_size_id ) throws RemoteException, SQLException;
}
