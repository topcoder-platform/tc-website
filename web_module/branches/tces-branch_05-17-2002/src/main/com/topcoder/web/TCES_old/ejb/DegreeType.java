package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.DegreeTypeObject;

public interface DegreeType extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer degree_type_id, String description ) throws RemoteException, SQLException;
	public void delete( Integer degree_type_id ) throws RemoteException, SQLException;
	public DegreeTypeObject request( int cmd, DegreeTypeObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setDescription( Integer degree_type_id, String description ) throws RemoteException, SQLException;
	public String getDescription( Integer degree_type_id ) throws RemoteException, SQLException;
}
