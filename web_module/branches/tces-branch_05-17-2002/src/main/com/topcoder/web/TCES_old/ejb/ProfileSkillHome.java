package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileSkill;

public interface ProfileSkillHome extends javax.ejb.EJBHome {
	public ProfileSkill create() throws RemoteException, CreateException;
}
