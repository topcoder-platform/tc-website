package com.topcoder.web.ejb.termsofuse;

import javax.ejb.EJBObject;

import java.rmi.RemoteException;
import javax.ejb.EJBException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public interface TermsOfUse extends EJBObject {
    long createTermsOfUse();
    void setText(long termsOfUseId, String text) throws RemoteException, EJBException;
    void setTermsOfUseTypeId(long termsOfUseId, long id) throws RemoteException, EJBException;
    String getText(long termsOfUseId);
    long getTermsOfUseTypeId(long termsOfUseId);
}