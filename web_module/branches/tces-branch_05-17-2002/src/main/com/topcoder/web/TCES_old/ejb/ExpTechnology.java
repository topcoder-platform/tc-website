package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ExpTechnologyObject;

public interface ExpTechnology extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer experience_id, Integer technology_id ) throws RemoteException, SQLException;
	public void delete( Integer experience_id ) throws RemoteException, SQLException;
	public ExpTechnologyObject request( int cmd, ExpTechnologyObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setTechnologyId( Integer experience_id, Integer technology_id ) throws RemoteException, SQLException;
	public Integer getTechnologyId( Integer experience_id ) throws RemoteException, SQLException;
}
