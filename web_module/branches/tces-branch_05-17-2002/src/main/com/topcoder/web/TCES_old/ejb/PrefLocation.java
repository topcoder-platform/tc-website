package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefLocationObject;

public interface PrefLocation extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer profile_id, Integer location_id ) throws RemoteException, SQLException;
	public void delete( Integer profile_id ) throws RemoteException, SQLException;
	public PrefLocationObject request( int cmd, PrefLocationObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public String findByLocationId( Integer location_id ) throws RemoteException, SQLException;
	public void setLocationId( Integer profile_id, Integer location_id ) throws RemoteException, SQLException;
	public Integer getLocationId( Integer profile_id ) throws RemoteException, SQLException;
}
