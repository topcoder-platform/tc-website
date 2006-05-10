package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.Company;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 10, 2006
 */
public class CompanyDAO extends Base {

    /**
     * Create a CompanyDAO object using the default connection information.
     */
    public CompanyDAO() {
        super();
    }

    public CompanyDAO(Session session) {
        super(session);
    }


    public Company find(Long id) {
        Company ret = null;
        try {
            begin();
            ret = (Company)session.load(Company.class, id);
            commit();
        } catch (HibernateException e) {
            rollback();
            throw e;
        }
        return ret;

    }

    public void saveOrUpdate(Company u) {
        try {
            begin();
            session.saveOrUpdate(u);
            commit();
        } catch (HibernateException e) {
            rollback();
            throw e;
        }

    }
}

