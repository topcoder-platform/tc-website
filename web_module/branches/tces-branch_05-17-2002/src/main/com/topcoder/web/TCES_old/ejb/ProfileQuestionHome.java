package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileQuestion;

public interface ProfileQuestionHome extends javax.ejb.EJBHome {
	public ProfileQuestion create() throws RemoteException, CreateException;
}
