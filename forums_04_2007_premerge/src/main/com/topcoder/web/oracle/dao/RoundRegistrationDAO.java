package com.topcoder.web.oracle.dao;

import com.topcoder.web.common.model.User;
import com.topcoder.web.oracle.model.Round;
import com.topcoder.web.oracle.model.RoundRegistration;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public interface RoundRegistrationDAO {

    void saveOrUpdate(RoundRegistration reg);

    RoundRegistration find(Round r, User u);

    RoundRegistration find(Integer roundId, Long userId);

}

