package	com.topcoder.web.render.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.SecureObjectObject;

public interface SecureObject extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer secure_object_id, String secure_object_type ) throws RemoteException, SQLException;
	public void delete( Integer secure_object_id ) throws RemoteException, SQLException;
	public SecureObjectObject request( int cmd, SecureObjectObject obj ) throws RemoteException, SQLException;
	public void setSecureObjectType( Integer secure_object_id, String secure_object_type ) throws RemoteException, SQLException;
	public String getSecureObjectType( Integer secure_object_id ) throws RemoteException, SQLException;
	public void clearCache() throws RemoteException;
}
