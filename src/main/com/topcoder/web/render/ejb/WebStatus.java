package	com.topcoder.web.render.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.WebStatusObject;

public interface WebStatus extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer status_id, String status_desc ) throws RemoteException, SQLException;
	public void delete( Integer status_id ) throws RemoteException, SQLException;
	public WebStatusObject request( int cmd, WebStatusObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public String findByStatusDesc( String status_desc ) throws RemoteException, SQLException;
	public void setStatusDesc( Integer status_id, String status_desc ) throws RemoteException, SQLException;
	public String getStatusDesc( Integer status_id ) throws RemoteException, SQLException;
	public void clearCache() throws RemoteException;
}
