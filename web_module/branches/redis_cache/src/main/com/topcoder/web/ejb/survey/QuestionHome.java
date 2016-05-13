package com.topcoder.web.ejb.survey;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public interface QuestionHome extends EJBHome {
    public Question create() throws CreateException, RemoteException;
}
