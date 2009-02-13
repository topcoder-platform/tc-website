package com.topcoder.web.ejb.termsofuse;

import java.rmi.RemoteException;
import javax.ejb.EJBException;
import javax.ejb.EJBObject;

public interface TermsOfUse extends EJBObject {

    public long createTermsOfUse() throws EJBException, RemoteException;

    public long getTermsOfUseTypeId(long termsOfUseId)
                                           throws EJBException, RemoteException;
  
    public void setTermsOfUseTypeId(long termsOfUseId,
                                  long termsOfUseTypeId)
                                           throws EJBException, RemoteException;

    public String getText(long termsOfUseId)
                                           throws EJBException, RemoteException;

    public void setText(long termsOfUseId, String text)
                                           throws EJBException, RemoteException;

};
