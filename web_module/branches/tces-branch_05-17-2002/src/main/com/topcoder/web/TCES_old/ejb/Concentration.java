package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ConcentrationObject;

public interface Concentration extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer concentration_id, Integer subject_id, Integer education_id, Integer concentration_type ) throws RemoteException, SQLException;
	public void delete( Integer concentration_id ) throws RemoteException, SQLException;
	public ConcentrationObject request( int cmd, ConcentrationObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setSubjectId( Integer concentration_id, Integer subject_id ) throws RemoteException, SQLException;
	public Integer getSubjectId( Integer concentration_id ) throws RemoteException, SQLException;
	public void setEducationId( Integer concentration_id, Integer education_id ) throws RemoteException, SQLException;
	public Integer getEducationId( Integer concentration_id ) throws RemoteException, SQLException;
	public void setConcentrationType( Integer concentration_id, Integer concentration_type ) throws RemoteException, SQLException;
	public Integer getConcentrationType( Integer concentration_id ) throws RemoteException, SQLException;
}
