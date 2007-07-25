package com.topcoder.web.ejb.collegetour;

import javax.ejb.EJBLocalHome;
import javax.ejb.CreateException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 5, 2005
 */
public interface RegistrationLocalHome extends EJBLocalHome {
    public RegistrationLocal create() throws CreateException;
}
