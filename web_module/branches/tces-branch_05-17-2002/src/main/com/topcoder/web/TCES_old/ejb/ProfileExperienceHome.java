package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileExperience;

public interface ProfileExperienceHome extends javax.ejb.EJBHome {
	public ProfileExperience create() throws RemoteException, CreateException;
}
