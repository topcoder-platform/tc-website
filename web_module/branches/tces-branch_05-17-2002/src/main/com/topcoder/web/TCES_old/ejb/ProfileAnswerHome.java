package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileAnswer;

public interface ProfileAnswerHome extends javax.ejb.EJBHome {
	public ProfileAnswer create() throws RemoteException, CreateException;
}
