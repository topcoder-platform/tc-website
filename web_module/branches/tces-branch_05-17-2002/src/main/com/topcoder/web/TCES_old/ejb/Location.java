package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.LocationObject;

public interface Location extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer location_id, String description ) throws RemoteException, SQLException;
	public void delete( Integer location_id ) throws RemoteException, SQLException;
	public LocationObject request( int cmd, LocationObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setDescription( Integer location_id, String description ) throws RemoteException, SQLException;
	public String getDescription( Integer location_id ) throws RemoteException, SQLException;
}
