package	com.topcoder.web.render.ejb;

import	javax.ejb.EJBHome;
import	javax.ejb.CreateException;
import	java.rmi.RemoteException;
import	com.topcoder.web.render.ejb.WebCountryLanguage;

public interface WebCountryLanguageHome extends javax.ejb.EJBHome {
	public WebCountryLanguage create() throws RemoteException, CreateException;
}
