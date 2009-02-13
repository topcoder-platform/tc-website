package com.topcoder.web.csf.dao;

import com.topcoder.web.common.model.User;
import com.topcoder.web.csf.model.ContestRegistration;
import com.topcoder.web.csf.model.Contest;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 19, 2006
 */
public interface ContestRegistrationDAO {
    void saveOrUpdate(ContestRegistration reg);

    ContestRegistration find(Contest c, User u);
}
