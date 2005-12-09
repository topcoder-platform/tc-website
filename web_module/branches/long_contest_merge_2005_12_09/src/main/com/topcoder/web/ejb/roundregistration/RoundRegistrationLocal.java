package com.topcoder.web.ejb.roundregistration;

import javax.ejb.EJBException;
import javax.ejb.EJBLocalObject;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 6, 2005
 */
public interface RoundRegistrationLocal extends EJBLocalObject {
    void createRoundRegistration(long userId, long roundId) throws EJBException;

    boolean exists(long userId, long roundId) throws EJBException;
}
