package	com.topcoder.web.render.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.GroupObject;

public interface Group extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer group_id, String group_desc, Integer access_id ) throws RemoteException, SQLException;
	public void delete( Integer group_id ) throws RemoteException, SQLException;
	public GroupObject request( int cmd, GroupObject obj ) throws RemoteException, SQLException;
	public String findByGroupDesc( String group_desc ) throws RemoteException, SQLException;
	public void setGroupDesc( Integer group_id, String group_desc ) throws RemoteException, SQLException;
	public String getGroupDesc( Integer group_id ) throws RemoteException, SQLException;
	public void setAccessId( Integer group_id, Integer access_id ) throws RemoteException, SQLException;
	public Integer getAccessId( Integer group_id ) throws RemoteException, SQLException;
	public void clearCache() throws RemoteException;
}
