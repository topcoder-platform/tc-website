package	com.topcoder.web.render.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.WebContentGroupObject;

public interface WebContentGroup extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer content_group_id, String content_group_desc ) throws RemoteException, SQLException;
	public void delete( Integer content_group_id ) throws RemoteException, SQLException;
	public WebContentGroupObject request( int cmd, WebContentGroupObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setContentGroupDesc( Integer content_group_id, String content_group_desc ) throws RemoteException, SQLException;
	public String getContentGroupDesc( Integer content_group_id ) throws RemoteException, SQLException;
	public void clearCache() throws RemoteException;
}
