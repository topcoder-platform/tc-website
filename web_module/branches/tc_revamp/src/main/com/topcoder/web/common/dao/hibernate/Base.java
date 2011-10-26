package com.topcoder.web.common.dao.hibernate;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.HibernateUtils;
import org.hibernate.Query;
import org.hibernate.Session;

import java.io.Serializable;
import java.util.List;

/**
 * @author dok
 * @version $Revision: 66662 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public abstract class Base {

    protected static final Logger log = Logger.getLogger(Base.class);

    protected Session session;

    public Base() {
        session = HibernateUtils.getSession();
    }

    public Base(Session session) {
        this.session = session;
    }


    protected void saveOrUpdate(Object o) {
        session.saveOrUpdate(o);
    }

    protected void delete(Object o) {
        session.delete(o);
    }

    protected Object find(Class c, Serializable id) {
        return session.get(c, id);
    }

    protected List findAll(Class c) {
        return findAll(c, null, (String) null);
    }

    protected Object findOne(Class c, String property, String value) {
        Object ret;
        StringBuffer query = new StringBuffer(100);
        query.append("from ");
        query.append(c.getName());
        query.append(" where ");
        query.append(property);
        query.append(" = ");
        query.append("?");
        Query q = session.createQuery(query.toString());
        q.setString(0, value);
        ret = q.uniqueResult();
        return ret;
    }

    protected List findAll(Class c, String property, String value) {
        List ret;
        StringBuffer query = new StringBuffer(100);
        query.append("from ");
        query.append(c.getName());
        if (property != null && value != null) {
            query.append(" where ");
            query.append(property);
            query.append(" = ");
            query.append("?");
        }
        Query q = session.createQuery(query.toString());
        if (property != null && value != null) {
            q.setString(0, value);
        }
        ret = q.list();
        return ret;
    }

    protected List findAll(Class c, String property, Integer value) {
        List ret;
        StringBuffer query = new StringBuffer(100);
        query.append("from ");
        query.append(c.getName());
        query.append(" where ");
        if (property != null && value != null) {
            query.append(property);
            query.append(" = ");
            query.append("?");
        }
        Query q = session.createQuery(query.toString());
        if (property != null && value != null) {
            q.setInteger(0, value);
        }
        ret = q.list();
        return ret;
    }

    protected List findAll(Class c, String property, Long value) {
        List ret;
        StringBuffer query = new StringBuffer(100);
        query.append("from ");
        query.append(c.getName());
        query.append(" where ");
        if (property != null && value != null) {
            query.append(property);
            query.append(" = ");
            query.append("?");
        }
        Query q = session.createQuery(query.toString());
        if (property != null && value != null) {
            q.setLong(0, value);
        }
        ret = q.list();
        return ret;
    }

}
