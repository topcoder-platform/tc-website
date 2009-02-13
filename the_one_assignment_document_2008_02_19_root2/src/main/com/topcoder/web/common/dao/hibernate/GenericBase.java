package com.topcoder.web.common.dao.hibernate;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.dao.GenericDAO;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 27, 2007
 */
public abstract class GenericBase<T, ID extends Serializable> implements GenericDAO<T, ID> {
    protected static final Logger log = Logger.getLogger(Base.class);

    private Session session;
    private Class<T> persistentClass;

    @SuppressWarnings("unchecked")
    public GenericBase() {
        session = HibernateUtils.getSession();
        this.persistentClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    public GenericBase(Session session) {
        this();
        this.session = session;
    }

    public void delete(T entity) {
        session.delete(entity);
    }

    public void saveOrUpdate(T entity) {
        session.saveOrUpdate(entity);
    }

    @SuppressWarnings("unchecked")
    public T find(ID id) {
        return (T) session.get(getPersistentClass(), id);
    }

    public List<T> findAll() {
        return findByCriteria();
    }

    @SuppressWarnings("unchecked")
    protected List<T> findByCriteria(Criterion... criterion) {
        Criteria crit = getSession().createCriteria(getPersistentClass());
        for (Criterion c : criterion) {
            crit.add(c);
        }
        return crit.list();
    }


    @SuppressWarnings("unchecked")
    protected T findOne(Criterion... criterion) {
        Criteria crit = getSession().createCriteria(getPersistentClass());
        for (Criterion c : criterion) {
            crit.add(c);
        }
        return (T) crit.uniqueResult();
    }

    protected Session getSession() {
        return session;
    }

    protected void setSession(Session session) {
        this.session = session;
    }

    public Class<T> getPersistentClass() {
        return persistentClass;
    }

}
