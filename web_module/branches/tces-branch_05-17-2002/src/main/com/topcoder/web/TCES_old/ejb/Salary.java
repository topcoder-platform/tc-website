package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.SalaryObject;

public interface Salary extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer salary_id, String description ) throws RemoteException, SQLException;
	public void delete( Integer salary_id ) throws RemoteException, SQLException;
	public SalaryObject request( int cmd, SalaryObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setDescription( Integer salary_id, String description ) throws RemoteException, SQLException;
	public String getDescription( Integer salary_id ) throws RemoteException, SQLException;
}
