package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.PrefTechnologyObject;

public interface PrefTechnology extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer profile_id, Integer technology_id ) throws RemoteException, SQLException;
	public void delete( Integer profile_id ) throws RemoteException, SQLException;
	public PrefTechnologyObject request( int cmd, PrefTechnologyObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public String findByTechnologyId( Integer technology_id ) throws RemoteException, SQLException;
	public void setTechnologyId( Integer profile_id, Integer technology_id ) throws RemoteException, SQLException;
	public Integer getTechnologyId( Integer profile_id ) throws RemoteException, SQLException;
}
