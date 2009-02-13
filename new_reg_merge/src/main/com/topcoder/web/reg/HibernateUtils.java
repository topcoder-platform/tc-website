package com.topcoder.web.reg;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.reg.model.TCInterceptor;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;

import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class HibernateUtils {
    protected static Logger log = Logger.getLogger(HibernateUtils.class);
    //private static final ThreadLocal tSession = new ThreadLocal();
    //private static final ThreadLocal tTransaction = new ThreadLocal();
    private static final String INTERCEPTOR_CLASS = "hibernate.util.interceptor_class";

    private static Configuration configuration;
    private static SessionFactory sessionFactory;


    static {
        // Create the initial SessionFactory from the default configuration files
        try {
            configuration = new Configuration();

            // Read not only hibernate.properties, but also hibernate.cfg.xml
            configuration.configure();

            // Set global interceptor from configuration
            setInterceptor(configuration, new TCInterceptor());

            if (configuration.getProperty(Environment.SESSION_FACTORY_NAME) != null) {
                // Let Hibernate bind the factory to JNDI
                configuration.buildSessionFactory();
                sessionFactory = getFactory();
            } else {
                // or use static variable handling
                sessionFactory = configuration.buildSessionFactory();
            }

        } catch (Throwable ex) {
            // We have to catch Throwable, otherwise we will miss
            // NoClassDefFoundError and other subclasses of Error
            log.error("Building SessionFactory failed.", ex);
            throw new ExceptionInInitializerError(ex);
        }
    }


    public static Interceptor getInterceptor() {
        return configuration.getInterceptor();
    }

    /**
     * Resets global interceptor to default state.
     */
    public static void resetInterceptor() {
        log.debug("Resetting global interceptor to configuration setting");
        setInterceptor(configuration, null);
    }

    /**
     * Either sets the given interceptor on the configuration or looks
     * it up from configuration if null.
     */
    private static void setInterceptor(Configuration configuration, Interceptor interceptor) {
        String interceptorName = configuration.getProperty(INTERCEPTOR_CLASS);
        if (interceptor == null && interceptorName != null) {
            try {
                Class interceptorClass =
                        HibernateUtils.class.getClassLoader().loadClass(interceptorName);
                interceptor = (Interceptor) interceptorClass.newInstance();
            } catch (Exception ex) {
                throw new RuntimeException("Could not configure interceptor: " + interceptorName, ex);
            }
        }
        if (interceptor != null) {
            configuration.setInterceptor(interceptor);
        } else {
            configuration.setInterceptor(EmptyInterceptor.INSTANCE);
        }
    }


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
        return getFactory().getCurrentSession();
/*
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
*/
    }

    /**
     * Return the session factory.
     *
     * @return the session factory
     */
    public static SessionFactory getFactory() {
        SessionFactory ret=null;
        String sfName = configuration.getProperty(Environment.SESSION_FACTORY_NAME);
        if (sessionFactory!=null) {
            ret = sessionFactory;
        } else if (sfName != null) {
                log.debug("Looking up SessionFactory in JNDI.");
                try {
                    ret = (SessionFactory) new InitialContext().lookup(sfName);
                } catch (NamingException ex) {
                    throw new RuntimeException(ex);
                }
        }
        if (ret == null)
            throw new IllegalStateException("SessionFactory not available.");
        return ret;

    }

    /**
     * Close the session if it exists in the currently executing thread.
     */
    public static void closeSession() {
        Session s = getFactory().getCurrentSession();
        if (s.isOpen()) {
            getFactory().getCurrentSession().close();
        }
/*
        Session session = (Session) tSession.get();
        if (session != null) {
            commit();
            session.close();
            tSession.set(null);
        }
*/
    }

    /**
     * Close the factory.
     */
    public static void closeFactory() {
        SessionFactory f = getFactory();
        if (f != null) {
            f.close();
        }
    }

    /**
     * Close both the Session and the factory
     */
    public static void close() {
        closeSession();
        closeFactory();
    }

    public static void begin() {
        log.debug("begin transaction");
        getSession().beginTransaction();
        log.debug("transasction started");

    }

    public static void commit() {
        log.debug("commit transaction");
        Transaction t = getSession().getTransaction();
        if (t.isActive()) {
            t.commit();
        }
    }

    public static void rollback() {
        log.debug("rollback transaction");
        try {
            Transaction t = getFactory().getCurrentSession().getTransaction();
            if (t != null && t.isActive()) {
                t.rollback();
            }
        } catch (HibernateException e) {
            log.error("Failed to rollback transaction");
        }
    }


}
