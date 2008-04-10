package com.topcoder.web.common.dao.hibernate;

import org.hibernate.Session;

import com.topcoder.web.common.dao.PasswordRecoveryDAO;
import com.topcoder.web.common.model.PasswordRecovery;

public class PasswordRecoveryDAOHibernate extends Base implements PasswordRecoveryDAO {

    public PasswordRecoveryDAOHibernate() {
        super();
    }

    public PasswordRecoveryDAOHibernate(Session session) {
        super(session);
    }

    public PasswordRecovery find(Long id) {
        return (PasswordRecovery) find(PasswordRecovery.class, id);

    }
    public void saveOrUpdate(PasswordRecovery pr) {
        super.saveOrUpdate(pr);
    }

}
