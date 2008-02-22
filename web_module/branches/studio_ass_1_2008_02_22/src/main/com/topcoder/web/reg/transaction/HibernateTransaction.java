package com.topcoder.web.reg.transaction;

import com.topcoder.web.common.HibernateUtils;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public class HibernateTransaction implements Transaction {


    public HibernateTransaction() {

    }

    public void begin() throws TransactionException {
        HibernateUtils.begin();
    }

    public void commit() throws TransactionException {
        HibernateUtils.commit();
    }

    public boolean isActive() throws TransactionException {
        return HibernateUtils.getSession().getTransaction().isActive();
    }

    public void rollback() throws TransactionException {
        HibernateUtils.rollback();
    }
}