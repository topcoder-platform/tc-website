package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.SchoolObject;

public interface School extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer school_id, String name, String location ) throws RemoteException, SQLException;
	public void delete( Integer school_id ) throws RemoteException, SQLException;
	public SchoolObject request( int cmd, SchoolObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setName( Integer school_id, String name ) throws RemoteException, SQLException;
	public String getName( Integer school_id ) throws RemoteException, SQLException;
	public void setLocation( Integer school_id, String location ) throws RemoteException, SQLException;
	public String getLocation( Integer school_id ) throws RemoteException, SQLException;
}
