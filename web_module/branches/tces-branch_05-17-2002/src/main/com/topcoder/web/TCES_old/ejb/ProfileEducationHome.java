package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileEducation;

public interface ProfileEducationHome extends javax.ejb.EJBHome {
	public ProfileEducation create() throws RemoteException, CreateException;
}
