package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.SectorAgreement;

public interface SectorAgreementHome extends javax.ejb.EJBHome {
	public SectorAgreement create() throws RemoteException, CreateException;
}
