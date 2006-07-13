package com.topcoder.web.ejb.roundregistration;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 6, 2005
 */
public interface RoundRegistrationLocalHome extends EJBLocalHome {

    RoundRegistrationLocal create() throws CreateException;
}
