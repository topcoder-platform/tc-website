package	com.topcoder.web.TCES.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.Skill;

public interface SkillHome extends javax.ejb.EJBHome {
	public Skill create() throws RemoteException, CreateException;
}
