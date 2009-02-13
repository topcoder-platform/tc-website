package com.topcoder.web.ejb.termsofuse;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface TermsOfUse extends EJBObject {

    public long createTermsOfUse() throws EJBException, RemoteException;

    public long getTermsOfUseTypeId(long _terms_of_use_id)
            throws EJBException, RemoteException;

    public void setTermsOfUseTypeId(long _terms_of_use_id,
                                    long _terms_of_use_type_id)
            throws EJBException, RemoteException;

    public String getText(long _terms_of_use_id)
            throws EJBException, RemoteException;

    public void setText(long _terms_of_use_id, String _text)
            throws EJBException, RemoteException;

}

;
