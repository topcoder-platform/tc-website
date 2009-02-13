package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.PasswordRecovery;

/**
 * @author cucu
 */
public interface PasswordRecoveryDAO {

    PasswordRecovery find(Long id);

    void saveOrUpdate(PasswordRecovery pr);

}
