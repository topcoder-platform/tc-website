package com.topcoder.web.ejb.termsofuse;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface TermsOfUse extends EJBObject {

    TermsOfUseEntity updateTermsOfUse(TermsOfUseEntity terms, String dataSource) throws EJBException, RemoteException;

    TermsOfUseEntity getEntity(long termsOfUseId, String dataSource) throws EJBException, RemoteException;

    /**
     * @param termsOfUseId
     * @param dataSource
     * @return
     * @throws EJBException
     * @throws RemoteException
     * @deprecated since 1.1
     */
    long getTermsOfUseTypeId(long termsOfUseId, String dataSource)
            throws EJBException, RemoteException;

    /**
     * @param termsOfUseId
     * @param termsOfUseTypeId
     * @param dataSource
     * @throws EJBException
     * @throws RemoteException
     * @deprecated since 1.1
     */
    void setTermsOfUseTypeId(long termsOfUseId,
                             long termsOfUseTypeId, String dataSource)
            throws EJBException, RemoteException;

    /**
     * @param termsOfUseId
     * @param dataSource
     * @return
     * @throws EJBException
     * @throws RemoteException
     * @deprecated since 1.1
     */
    String getText(long termsOfUseId, String dataSource)
            throws EJBException, RemoteException;

    /**
     * @param termsOfUseId
     * @param text
     * @param dataSource
     * @throws EJBException
     * @throws RemoteException
     * @deprecated since 1.1
     */
    void setText(long termsOfUseId, String text, String dataSource)
            throws EJBException, RemoteException;

}
