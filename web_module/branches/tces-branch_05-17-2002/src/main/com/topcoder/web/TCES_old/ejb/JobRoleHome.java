package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.JobRole;

public interface JobRoleHome extends javax.ejb.EJBHome {
	public JobRole create() throws RemoteException, CreateException;
}
