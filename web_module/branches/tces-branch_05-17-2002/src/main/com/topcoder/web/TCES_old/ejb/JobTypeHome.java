package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.JobType;

public interface JobTypeHome extends javax.ejb.EJBHome {
	public JobType create() throws RemoteException, CreateException;
}
