package com.topcoder.web.common;

import com.topcoder.web.common.model.TCInterceptor;
import com.topcoder.shared.util.logging.Logger;
import org.hibernate.SessionFactory;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.EntityManager;
import javax.naming.NamingException;
import javax.naming.InitialContext;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 31, 2007
 */
public class JPAUtils {
    protected static Logger log = Logger.getLogger(JPAUtils.class);
//    private static final String INTERCEPTOR_CLASS = "hibernate.util.interceptor_class";

/*
    private static Configuration configuration;
    private static SessionFactory sessionFactory;
*/
    private static EntityManagerFactory emf;

    static {
        // Create the initial SessionFactory from the default configuration files
        try {

            emf = Persistence.createEntityManagerFactory("common");


/*

            configuration = new Configuration();

            // Read not only hibernate.properties, but also hibernate.cfg.xml
            configuration.configure();

            // Set global interceptor from configuration
            setInterceptor(configuration, new TCInterceptor());
*/

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


  /*  public static Interceptor getInterceptor() {
        return configuration.getInterceptor();
    }
*/
    /**
     * Resets global interceptor to default state.
     */
/*
    public static void resetInterceptor() {
        log.debug("Resetting global interceptor to configuration setting");
        setInterceptor(configuration, null);
    }
*/

    /**
     * Either sets the given interceptor on the configuration or looks
     * it up from configuration if null.
     */
/*    private static void setInterceptor(Configuration configuration, Interceptor interceptor) {
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
    }*/


    /**
     * If the session doesn't exist in the currently executing thread,
     * create it and begin a transaction, hang onto it in case the
     * current thread needs it again and return it.
     *
     * @return the session for this thread.
     */
    public static EntityManager getEntityManager() {
        return getFactory().    getCurrentSession();
    }

    /**
     * Return the session factory.
     *
     * @return the session factory
     */
    public static synchronized EntityManagerFactory getFactory() {
        EntityManagerFactory ret = null;
        if (emf!=null) {
            ret = emf;
        }

        if (ret==null) {
            throw new IllegalStateException("EntityManagerFactory not available.");
        }

        return ret;

    }

    /**
     * Close the session if it exists in the currently executing thread.
     */
    public static void closeSession() {
        log.debug("close session");
        Session s = getFactory().getCurrentSession();
        if (s.isOpen()) {
            s.close();
        }
    }

    /**
     * Close the factory.
     */
    public static void closeFactory() {
        log.debug("close factory");
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
        Session s = getSession();
        if (log.isDebugEnabled()) {
            if (s.isOpen()) {
                log.debug("session is open");
            } else {
                log.debug("session is closed");
            }
        }
        s.beginTransaction();
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
        } catch (Throwable e) {
            log.error("Failed to rollback transaction " + e.getMessage());
        }
    }


}
