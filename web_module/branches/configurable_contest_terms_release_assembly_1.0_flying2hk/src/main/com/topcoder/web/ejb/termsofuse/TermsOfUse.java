package com.topcoder.web.ejb.termsofuse;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface TermsOfUse extends EJBObject {

    long createTermsOfUse(String dataSource, String idDataSource) throws EJBException, RemoteException;

    long getTermsOfUseTypeId(long termsOfUseId, String dataSource)
            throws EJBException, RemoteException;

    void setTermsOfUseTypeId(long termsOfUseId,
                             long termsOfUseTypeId, String dataSource)
            throws EJBException, RemoteException;

    String getText(long termsOfUseId, String dataSource)
            throws EJBException, RemoteException;

    void setText(long termsOfUseId, String text, String dataSource)
            throws EJBException, RemoteException;
    
    String getTitle(long termsOfUseId, String dataSource)
    		throws EJBException, RemoteException;
    
    void setTitle(long termsOfUseId, String title, String dataSource)
    		throws EJBException, RemoteException;
    
    boolean isElectronicallySignable(long termsOfUseId, String dataSource)
    		throws EJBException, RemoteException;
    
    void setElectronicallySignable(long termsOfUseId,
			boolean electronicallySignable, String dataSource)
        	throws EJBException, RemoteException;
    
    String getURL(long termsOfUseId, String dataSource)
			throws EJBException, RemoteException;

    void setURL(long termsOfUseId, String url, String dataSource)
			throws EJBException, RemoteException;
}
