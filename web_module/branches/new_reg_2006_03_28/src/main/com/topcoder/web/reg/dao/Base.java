package com.topcoder.web.reg.dao;

import org.hibernate.*;
import com.topcoder.web.reg.HibernateUtils;

import java.util.List;
import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public abstract class Base {

    protected Transaction transaction;
    protected Session session;

    public Base() {
        init();
    }


    protected void saveOrUpdate(Object o) {
        try {
            begin();
            session.saveOrUpdate(o);
            commit();
        } catch (HibernateException e) {
            rollback();
            throw e;
        }
    }

    protected Object find(Class c, Serializable id) {
        Object ret = null;
        try {
            begin();
            ret = session.load(c, id);
            commit();
        } catch (HibernateException e) {
            rollback();
            throw e;
        }
        return ret;
    }

    protected List findAll(Class c) {
        List ret = null;
        try {
            begin();
            Query q = session.createQuery("from " + c.getName());
            ret = q.list();
            commit();
        } catch (HibernateException e) {
            rollback();
            throw e;
        }
        return ret;
    }

    private void init() {
        session = HibernateUtils.getSession();
    }

    protected void begin() {
        if (transaction==null) {
            transaction = session.beginTransaction();
        } else if (transaction.isActive()) {
            throw new TransactionException("Transaction already started");
        }
    }

    protected void commit() {
        if (transaction==null) {
            throw new TransactionException("No transaction");
        } else {
            transaction.commit();
        }
    }

    protected void rollback() {
        if (transaction!=null&&transaction.isActive()) {
            transaction.rollback();
        }
    }
}
