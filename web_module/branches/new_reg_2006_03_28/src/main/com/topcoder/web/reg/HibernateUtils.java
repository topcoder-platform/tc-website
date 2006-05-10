package com.topcoder.web.reg;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.error.HibernateInitializationException;
import com.topcoder.web.reg.model.TCInterceptor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class HibernateUtils {
    private static final ThreadLocal tSession = new ThreadLocal();
    private static final ThreadLocal tLocalSession = new ThreadLocal();
    private static final String HIBERNATE_JNDI_KEY = "java:comp/env/hibernate/SessionFactory";
    private static boolean factoryInitComplete = false;
    private static final ThreadLocal tLocalFactory = new ThreadLocal();
    private static final ThreadLocal tTransaction = new ThreadLocal();

    /**
     * If the session doesn't exist in the currently executing thread,
     * create it and begin a transaction, hang onto it in case the
     * current thread needs it again and return it.
     * <p/>
     * If for some reason the hibernate factory failed to initialize
     * properly and we're still executing the application, then
     * we'll throw a runtime exception.
     *
     * @return the session for this thread.
     */
    public static Session getSession() {
        try {
            Session ret = (Session) tSession.get();
            if (ret == null) {
                ret = getFactory().openSession(new TCInterceptor());
                begin(ret);
            }
            tSession.set(ret);
            return ret;
        } catch (HibernateInitializationException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * If the session doesn't exist in the currently executing thread,
     * create it and begin a transaction, hang onto it in case the
     * current thread needs it again  and return it.
     * <p/>
     * If for some reason the hibernate factory failed to initialize
     * properly and we're still executing the application, then
     * we'll throw a runtime exception.
     *
     * @return the session for this thread.
     */
    public static Session getLocalSession() {
        Session ret = (Session) tLocalSession.get();
        if (ret == null) {
            ret = getLocalFactory().openSession(new TCInterceptor());
            begin(ret);
        }
        tLocalSession.set(ret);
        return ret;

    }


    /**
     * Create the session factory.  We will only have one
     * for the application.
     */
    public static synchronized void initFactory() {
        if (!factoryInitComplete) {
            Configuration conf = new Configuration();
            conf.configure();
            conf.buildSessionFactory();
            factoryInitComplete = true;
        }
    }

    /**
     * Return the session factory.
     *
     * @return the session factory
     * @throws HibernateInitializationException
     *          if for some reason getting the factory fails.
     */
    public static SessionFactory getFactory() throws HibernateInitializationException {
        if (!factoryInitComplete) {
            initFactory();
        }
        InitialContext ctx = null;
        SessionFactory factory;
        try {
            ctx = new InitialContext();
            factory = (SessionFactory) ctx.lookup(HIBERNATE_JNDI_KEY);
        } catch (NamingException e) {
            throw new HibernateInitializationException(e);
        } finally {
            BaseProcessor.close(ctx);
        }
        return factory;
    }

    /**
     * Get the singleton session factory.
     *
     * @return the session factory
     */
    public static SessionFactory getLocalFactory() {
        SessionFactory ret = (SessionFactory) tLocalFactory.get();
        if (ret == null) {
            Configuration conf = new Configuration();
            //conf.getEventListeners().setSaveOrUpdateEventListeners(new SaveOrUpdateEventListener[] {new SaveListener()});
            conf.configure();
            ret = conf.buildSessionFactory();
            tLocalFactory.set(ret);
        }
        return ret;
    }

    /**
     * Close the session if it exists in the currently executing thread.
     */
    public static void closeSession() {
        Session session = (Session) tSession.get();
        if (session != null) {
            commit();
            session.close();
            tSession.set(null);
        }
    }

    /**
     * Close the session if it exists in the currently executing thread.
     */
    public static void closeLocalSession() {
        Session session = (Session) tLocalSession.get();
        if (session != null) {
            commit();
            session.close();
            tLocalSession.set(null);
        }
    }

    /**
     * Close the factory.
     */
    public static void closeFactory() {
        try {
            SessionFactory f = getFactory();
            if (f != null) {
                f.close();
            }
        } catch (HibernateInitializationException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Close the factory.
     */
    public static void closeLocalFactory() {
        SessionFactory ret = (SessionFactory) tLocalFactory.get();
        if (ret != null) {
            ret.close();
        }
    }

    /**
     * Close both the Session and the factory
     */
    public static void close() {
        closeSession();
        closeFactory();
    }

    public static void closeLocal() {
        closeLocalSession();
        closeLocalFactory();
    }


    private static void begin(Session session) {
        Transaction transaction = (Transaction)tTransaction.get();
        if (transaction == null || !transaction.isActive()) {
            transaction = session.beginTransaction();
        } 
        tTransaction.set(transaction);
    }

    private static void commit() {
        Transaction transaction = (Transaction)tTransaction.get();
        if (transaction != null && transaction.isActive()) {
            transaction.commit();
            tTransaction.set(null);
        }
    }

    public static void rollback() {
        Transaction transaction = (Transaction)tTransaction.get();
        if (transaction != null && transaction.isActive()) {
            transaction.rollback();
            closeSession();
            closeLocalSession();
            tTransaction.set(null);
        }
    }



}
