package com.topcoder.web.aolicq.dao;

import com.topcoder.web.common.model.User;
import com.topcoder.web.aolicq.model.Contest;
import com.topcoder.web.aolicq.model.ContestRegistration;

/**
 * @author dok
 * @version $Revision: 73726 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 19, 2006
 */
public interface ContestRegistrationDAO {
    void saveOrUpdate(ContestRegistration reg);

    ContestRegistration find(Contest c, User u);
}
