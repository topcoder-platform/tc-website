package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ConcentrationTypeObject;

public interface ConcentrationType extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer concentration_type, String description ) throws RemoteException, SQLException;
	public void delete( Integer concentration_type ) throws RemoteException, SQLException;
	public ConcentrationTypeObject request( int cmd, ConcentrationTypeObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setDescription( Integer concentration_type, String description ) throws RemoteException, SQLException;
	public String getDescription( Integer concentration_type ) throws RemoteException, SQLException;
}
