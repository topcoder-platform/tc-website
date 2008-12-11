package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.EventRegistration;

/**
 * @author dok
 * @version $Revision: 57593 $ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 14, 2007
 */
public interface EventRegistrationDAO {
    public EventRegistration find(Long userId, Long eventId);
}
