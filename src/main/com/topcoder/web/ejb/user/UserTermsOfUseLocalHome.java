package com.topcoder.web.ejb.user;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author cucu
 */
public interface UserTermsOfUseLocalHome extends EJBLocalHome {

    public UserTermsOfUseLocal create() throws CreateException;
}
