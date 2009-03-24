package com.topcoder.web.openaim.dao;

import com.topcoder.web.common.model.User;
import com.topcoder.web.openaim.model.Contest;
import com.topcoder.web.openaim.model.ContestRegistration;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 19, 2006
 */
public interface ContestRegistrationDAO {
    void saveOrUpdate(ContestRegistration reg);

    ContestRegistration find(Contest c, User u);
}
